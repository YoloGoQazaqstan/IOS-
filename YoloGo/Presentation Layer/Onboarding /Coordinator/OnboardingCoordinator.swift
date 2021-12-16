//
//  OnboardingCoordinator.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 14.12.2021.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = OnboardingViewController()
        vc.delegate = self 
        navigationController.pushViewController(vc, animated: true)
    }
    
}
