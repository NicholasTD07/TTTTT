//
//  ViewController.swift
//  fancy-triangle-animation-in-kiwanuka
//
//  Created by Nicholas Tian on 12/03/2016.
//  Copyright © 2016 nicktd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blackColor()

        setupGestureRecognizer()

        addTriangleAndAnimate()
    }

    func setupGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: "tapped")
        view.addGestureRecognizer(recognizer)
    }

    func tapped() {
        addTriangleAndAnimate()
    }

    func addTriangleAndAnimate() {
        let center = CGPoint(x: view.frame.midX, y: view.frame.midY)

        let triangle = EquilateralTriangle.layerForTriangle(centeredAt: center, radius: 500, color: UIColor.redColor())

        view.layer.addSublayer(triangle)

        let animation = EquilateralTriangle.pathAnimationToTriangle(centeredAt: center, radius: 100, duration: 2)
        animation.delegate = self
        animation.setValue(triangle, forKey: kAnimationLayerKey)

        triangle.addAnimation(animation, forKey: nil)

        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.toValue = UIColor.blackColor().CGColor
        colorAnimation.duration = 3

        triangle.addAnimation(colorAnimation, forKey: nil)
    }
}

let kAnimationLayerKey = "animationLayer"

extension ViewController {
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        guard let layer = anim.valueForKey(kAnimationLayerKey) as? CAShapeLayer else { return }

        layer.removeFromSuperlayer()
    }
}

struct EquilateralTriangle {
    static let angle = M_PI/3

    static func pathAnimationToTriangle(centeredAt center: CGPoint, radius: Double, duration: CFTimeInterval = 2) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "path")

        animation.toValue = EquilateralTriangle.pathForTriangle(centeredAt: center, radius: radius).CGPath
        animation.duration = duration

        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        /**
        Need the following two lines to make the shape stay in the state of the new path.
        */
        animation.fillMode = kCAFillModeBoth
        animation.removedOnCompletion = false

        return animation
    }

    static func pathForTriangle(centeredAt center: CGPoint, radius: Double = 10) -> UIBezierPath {
        let path = UIBezierPath()

        let xOffset = CGFloat(sin(angle) * radius)
        let yOffset = CGFloat(cos(angle) * radius)

        let top = CGPoint(x: center.x, y: center.y - CGFloat(radius))
        let left = CGPoint(x: center.x - xOffset, y: center.y + yOffset)
        let right = CGPoint(x: center.x + xOffset, y: center.y + yOffset)

        path.moveToPoint(top)
        path.addLineToPoint(left)
        path.addLineToPoint(right)
        path.closePath()

        return path
    }

    static func layerForTriangle(centeredAt center: CGPoint, radius: Double = 10, color: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()

        layer.path = pathForTriangle(centeredAt: center, radius: radius).CGPath
        layer.fillColor = nil
        layer.strokeColor = color.CGColor

        return layer
    }
}

