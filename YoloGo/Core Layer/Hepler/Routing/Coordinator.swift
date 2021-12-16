//
//  Coordinator.swift
//  YoloGo
//
//  Created by Zhanibek Santay on 12.12.2021.
//

import UIKit

// MARK: - BaseCoordinator

protocol BaseCoordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController {get set}
    func start()
}

extension BaseCoordinator {
    
    func append(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func append(childCoordinators: [Coordinator]) {
        self.childCoordinators.append(contentsOf: childCoordinators)
    }
    
    func remove(coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
    func removeChildCoordinator(at index: Int) {
        childCoordinators.remove(at: index)
    }
    
}

// MARK: - Coordinator

protocol Coordinator: BaseCoordinator {
    var navigationController: UINavigationController { get set }
}

extension Coordinator {
    
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popTo(viewController: UIViewController, animated: Bool) {
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
}
