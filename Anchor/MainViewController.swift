//
//  ViewController.swift
//  Anchor
//
//  Created by  Mr.Ki on 12.06.2022.
//

import UIKit
import MapKit
import CoreLocation

class MainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let notificationCenter = UNUserNotificationCenter.current()
    private var currentLocation: CLLocation?
   
    
    var notificationContent: UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.body = "Your anchor is dragging!"
        content.sound = UNNotificationSound.defaultCriticalSound(withAudioVolume: 1.0)
        return content
    }
    
    let mapView: MKMapView = {
        let map = MKMapView()

        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 50000)
        map.setCameraZoomRange(zoomRange, animated: true)

        map.overrideUserInterfaceStyle = .dark

        return map
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = MKMapType.satellite
        locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        view.backgroundColor = .systemOrange
        setup()
        layout()

        
        if CLLocationManager.locationServicesEnabled() {
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }

    
    func setup() {
        setupHeaderView()
        view.addSubview(mapView)
    }
    
    func layout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func setupHeaderView() {
        let header = HeaderMainView(frame: .zero)
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        view.addSubview(header)
        
   
    }

}

extension MainViewController {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     defer { currentLocation = locations.last }

     if currentLocation == nil {
         // Zoom user location
         if let userLocation = locations.last {
             let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
             mapView.setRegion(viewRegion, animated: false)
         }
     }
      
        
 }
    

}
