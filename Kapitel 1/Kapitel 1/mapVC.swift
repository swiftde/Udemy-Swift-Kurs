//
//  mapVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class mapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let manager = CLLocationManager()
    var geocoder = CLGeocoder()
    var placeMark: CLPlacemark?
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: view.frame)
        view.addSubview(mapView)
        mapView.delegate = self
        
        manager.requestAlwaysAuthorization()
        
        manager.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Such mich", style: .Plain, target: self, action: "searchButtonPressed:")
    }
    
    func searchButtonPressed(sender: UIBarButtonItem) {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
////        println("Neuer Ort: \(manager.location)")
//        
//        // let coordinates = manager.location!.coordinate
//        let coordinates = locations.last as? CLLocation
//
//        
//        if manager.location != nil {
//            geocoder.reverseGeocodeLocation(manager.location!) {
//                placemarks, error in
//                
//                if error == nil && placemarks!.count > 0 {
//                    
//                    self.placeMark = placemarks!.last as CLPlacemark?
//                    let adresse = "\(self.placeMark!.thoroughfare)\n\(self.placeMark!.postalCode) \(self.placeMark!.locality)\n\(self.placeMark!.country)"
//                    self.manager.stopUpdatingLocation()
//                    print(adresse)
//                    
//                    var annotation = MKPointAnnotation()
//                    annotation.coordinate(coordinates)
//                    annotation.title = self.placeMark!.thoroughfare
//                    annotation.subtitle = "\(self.placeMark!.postalCode) \(self.placeMark!.locality)"
//                    
//                    self.mapView.addAnnotation(annotation)
//                    
//                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//                    let region = MKCoordinateRegion(center: coordinates, span: span)
//                    self.mapView.setRegion(region, animated: true)
//                }
//            }
//        }
//    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "ident")
        pinView.canShowCallout = true
        pinView.animatesDrop = true
        pinView.pinColor = .Green
        let button = UIButton(type: UIButtonType.DetailDisclosure) as UIButton
        button.addTarget(self, action: "annotationButtonPressed:", forControlEvents: .TouchUpInside)
        pinView.rightCalloutAccessoryView = button
        return pinView
        
    }
    
    func annotationButtonPressed(sender: UIButton) {
        print("Button wurde gedrückt")
    }
    
}
