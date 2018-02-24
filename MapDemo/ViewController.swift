//
//  ViewController.swift
//  MapDemo
//
//  Created by Im100ruv on 24/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    // Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = 13.6558231
        let longitude: CLLocationDegrees = 79.4369599
        let latDelta: CLLocationDegrees = 0.02
        let lonDelta: CLLocationDegrees = 0.02
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        
        // Adding annotation to map
        let annotation = MKPointAnnotation()
        annotation.title = "YIIT"
        annotation.subtitle = "We work here!"
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
        
        // Adding user annotation with longpress
        let longPressRecog = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(gestureRecognizer:)))
        longPressRecog.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPressRecog)
    }

    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Your Place"
        annotation.subtitle = "You like to go here!"
        mapView.addAnnotation(annotation)
    }


}

