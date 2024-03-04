//
//  AppNAvigationController.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 29/02/24.
//

import UIKit

class AppNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [CarsViewController.build()]
    }
}
