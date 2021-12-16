//
//  MainCoordinator.swift
//  YoloGo
//
//  Created by Zhanibek Santay on 12.12.2021.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
        
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

// MARK: - Public

extension AppCoordinator {
    
    func start() {
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Flow Methods
    
    func presentMainOrder() {
//        let child = AuthorizationCoordinator(navigationController: navigationController)
//        child.parentCoordinator = self
//        childCoordinators.append(child)
//        child.start()
    }
}
