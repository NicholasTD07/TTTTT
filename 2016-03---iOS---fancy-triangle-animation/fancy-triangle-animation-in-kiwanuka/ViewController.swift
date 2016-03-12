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

        drawTriangle()
    }

    func drawTriangle() {
        let center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        let radius = 100 as Double

        let path = EquilateralTriangle.pathForTriangle(centeredAt: center, radius: radius)

        let triangle = CAShapeLayer()
        triangle.path = path.CGPath
        triangle.fillColor = nil
        triangle.strokeColor = UIColor.redColor().CGColor

        view.layer.addSublayer(triangle)
    }
}

struct EquilateralTriangle {
    static let angle = M_PI/3

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
}

