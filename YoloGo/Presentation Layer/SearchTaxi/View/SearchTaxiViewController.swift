//
//  SearchTaxiViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

final class SearchTaxiViewController: HomeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMapView()
        setFloatingPanel()
        setLayouts()
    }

}
