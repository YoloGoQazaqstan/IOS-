//
//  MainOrderCoordinator.swift
//  YoloGo
//
//  Created by Zhanibek Santay on 12.12.2021.
//

import UIKit

class MainOrderCoordinator: Coordinator {
 
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MainOrderViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
}
