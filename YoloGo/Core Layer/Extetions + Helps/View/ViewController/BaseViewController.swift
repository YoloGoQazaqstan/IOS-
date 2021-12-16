//
//  BaseViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 08.12.2021.
//

import UIKit

/// configure View Protocol
protocol ConfigureView {
    func setLayouts()
    func configureView()
}

class BaseViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBaseViewController()
    }
}

extension BaseViewController {
    
    // MARK: - Methods
    
    /// configureMethods
    func configureBaseViewController() {
        view.backgroundColor = .white
    }
}
