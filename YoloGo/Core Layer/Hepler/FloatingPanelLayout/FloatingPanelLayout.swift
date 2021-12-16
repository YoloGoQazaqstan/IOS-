//
//  FloatingPanelApearance .swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//
import FloatingPanel

class CustomFloatingPanelLayout: FloatingPanelBottomLayout{
    override var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .bottom: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}

extension FloatingPanelState {
    static let bottom: FloatingPanelState = FloatingPanelState(rawValue: "bottom", order: 460)
}
