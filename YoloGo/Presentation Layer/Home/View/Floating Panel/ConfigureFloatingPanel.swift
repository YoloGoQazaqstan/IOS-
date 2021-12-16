//
//  ConfigureFloatingPanel.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit
import FloatingPanel
import UIKit

extension HomeViewController: FloatingPanelControllerDelegate {
    
    func contentVC() -> UIViewController {
        let vc = HomeFloatingViewController()
        return vc
    }
    
    func setFloatingPanel() {
        fpc = FloatingPanelController()
        fpc.delegate = self
        fpc.set(contentViewController: contentVC())
        fpc.addPanel(toParent: self)
        fpc.layout = CustomFloatingPanelLayout()
        fpc.move(to: .bottom, animated: false, completion: nil)
        configureLayerFPC()
    }
    
    func configureLayerFPC() {
        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black.withAlphaComponent(0.4)
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 16
        shadow.spread = 8
        appearance.shadows = [shadow]
        appearance.cornerRadius = 30
        appearance.backgroundColor = .lightGray.withAlphaComponent(0.4)
        fpc.surfaceView.appearance = appearance
    }
    
}
