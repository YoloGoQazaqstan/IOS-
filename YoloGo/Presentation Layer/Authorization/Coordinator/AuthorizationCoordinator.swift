//
//  AuthorizationCoordinator.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 14.12.2021.
//

import UIKit

protocol OnboardingFlow {
    func showOnboardingFlow()
}

class AuthorizationCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = AuthorizationViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
}

// MARK: - FlowMethods

extension AuthorizationCoordinator: OnboardingFlow {
    
    func showOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        childCoordinators.append(onboardingCoordinator)
        onboardingCoordinator.start()
    }
}
