//
//  InstallMapBox.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit
import Mapbox

struct UserLocationCoordinate {
    static var lat = Double()
    static var lon = Double()
}

extension HomeViewController: MGLMapViewDelegate, CLLocationManagerDelegate {
    
    func setMapView() {
        mapView = MGLMapView(frame: view.bounds)
        
        guard let mapView = mapView else { return }
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        mapView.showsUserLocation = false
        mapView.allowsRotating = false
        mapView.logoView.isHidden = true

        mapView.compassView.isHidden = true
        
        view.addSubview(mapView)
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        
         if let userLocation = mapView.userLocation?.location?.coordinate {
             let coordinate = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
             mapView.setCenter(coordinate, zoomLevel: 15, animated: false)
         }
        // Aktau Location ушин кажет
//        else {
//            showAlert(alertString: "Включите геолокацию")
//            mapView.setCenter(AppKeys.turkestanCoordinate, zoomLevel: 15, animated: false)
//        }
     }
    
    func setMarker() {
        guard let mapView = mapView else { return }
        mapView.addSubview(marker)
        marker.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        marker.setShadow()
        
        UIView.animate(withDuration: 0.1) { [weak self] in
                        guard self == self else { return }
                        self!.marker.frame.origin.y -= 20
            } completion: { (_) in
                        UIView.animateKeyframes(withDuration: 1, delay: 0.5, options: [.autoreverse, .repeat], animations: {
                            self.marker.frame.origin.y += 20
            }, completion: nil)
        }
    }
    
    func configureCurrentLocation() {
        
        locationManager = CLLocationManager()
        
        guard let locationManager = locationManager else { return }
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if dissableRequestLocation == false {
            
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            }
            
            dissableRequestLocation = true
        }
        
        currentLocationButton.addTarget(self, action: #selector(showCurrentLocation), for: .touchUpInside)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        UserLocationCoordinate.lat = location.latitude
        UserLocationCoordinate.lon = location.longitude
        
        print("lat ---->", location.latitude)
        
        mapView?.setCenter(coordinate, zoomLevel: 15, animated: true)
        
        if dissableRequestLocation == true {
            locationManager?.stopUpdatingLocation()
        }
    }
    
    // MARK: - Get Center Coordinate
    
    func mapView(_ mapView: MGLMapView, regionDidChangeWith reason: MGLCameraChangeReason, animated: Bool) {
        
//        let lat = mapView.centerCoordinate.latitude
//        let lon = mapView.centerCoordinate.longitude
        floatingPanelWillShow()
    }
    
    func mapView(_ mapView: MGLMapView, regionWillChangeWith reason: MGLCameraChangeReason, animated: Bool) {
        floatingPanelWillHide()
    }
    
    
    // Configure Animation Floating Panel
    
    private func floatingPanelWillShow() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.fpc.move(to: .bottom, animated: false, completion: nil)
        }
    }
    
    private func floatingPanelWillHide() {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.fpc.move(to: .hidden, animated: false, completion: nil)
        }
    }
    
    
    // MARK: - Objective Methods
    
    @objc
    fileprivate func showCurrentLocation() {
        
        guard let mapView = mapView else { return }
        
        let center = CLLocationCoordinate2DMake(UserLocationCoordinate.lat, UserLocationCoordinate.lon)
        
        mapView.setCenter(center, zoomLevel: 15, animated: true)
    }
}
