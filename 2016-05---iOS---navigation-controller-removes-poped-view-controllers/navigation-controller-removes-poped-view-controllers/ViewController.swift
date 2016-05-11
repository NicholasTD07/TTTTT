//
//  ViewController.swift
//  navigation-controller-removes-poped-view-controllers
//
//  Created by Nicholas Tian on 11/05/2016.
//  Copyright © 2016 nicktd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var viewController: UIViewController = {
        let controller = UIViewController()

        controller.view.backgroundColor = .blackColor()

        return controller
    }()

    lazy var _navigationController: UINavigationController = {
        return UINavigationController(rootViewController: self.viewController)
    }()

    @IBAction func pushSomeViewController() {
        print("Push~")
        self.navigationController!.pushViewController(_navigationController.viewControllers.first!, animated: true)

        print("Pushed... ViewControllers left in _navi...: \(_navigationController.viewControllers.count)")
    }
}

