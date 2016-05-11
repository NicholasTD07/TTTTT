//
//  ViewController.swift
//  navigation-controller-removes-poped-view-controllers
//
//  Created by Nicholas Tian on 11/05/2016.
//  Copyright © 2016 nicktd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let _navigationController: UINavigationController = {
        let controller = UIViewController()

        controller.view.backgroundColor = .blackColor()

        return UINavigationController(rootViewController: controller)
    }()

    @IBAction func pushSomeViewController() {
        print("Push~")
        self.navigationController!.pushViewController(_navigationController.viewControllers.first!, animated: true)
    }
}

