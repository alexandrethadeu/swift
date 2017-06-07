//
//  ViewController.swift
//  Where Was I
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/30/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        if let lat = coord?.latitude {
            if let long = coord?.longitude {
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
                
            }
            
            UpdateSavedPin()
        }
        
        
        
    }
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        UpdateSavedPin()
        
    }
    func UpdateSavedPin () {
        if let oldCoords = DataStore().GetLastLocation() {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.longitude = Double(oldCoords.longitude)!
            
            annotation.title = "I Was here!"
            annotation.subtitle = "Remember?"
            
            mapView.addAnnotation(annotation)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled")
            return
        }
        
        print("Location allowed")
        mapView.showsUserLocation = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

