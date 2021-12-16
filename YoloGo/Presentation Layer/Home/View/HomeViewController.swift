//
//  HomeViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit
import Mapbox
import CoreLocation
import FloatingPanel

class HomeViewController: BaseViewController {
    
    var mapView: MGLMapView?
    var locationManager: CLLocationManager?
    var dissableRequestLocation = false
    var fpc: FloatingPanelController = FloatingPanelController()
    
    var currentLocationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "current")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.layer.cornerRadius = 8.0
        btn.backgroundColor = .white
        return btn
    }()
    
    public var marker: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "marker")
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        setFloatingPanel()
        setLayouts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if mapView != nil {
            mapView = nil
            mapView?.removeFromSuperview()
        }
    }
    
    deinit {
        print(#function)
    }
    
}

// MARK: - Configure Map

extension HomeViewController {
    
    func configureMapView() {
        setMapView()
        configureCurrentLocation()
        setMarker()
    }
}

// MARK: - Configure UI

extension HomeViewController: ConfigureView {
    
    func setLayouts() {
        
        [currentLocationButton].forEach {
            view.addSubview($0)
        }
        
        currentLocationButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(view.frame.size.width / 5.4)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.width.height.equalTo(44.0)
        }
    }
    
    func configureView() {
        
    }
}
