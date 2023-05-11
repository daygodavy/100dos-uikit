//
//  ViewController.swift
//  Project16
//
//  Created by Davy Chuon on 5/10/23.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home of the 2012 Summer Olympics")
        
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago")
        
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light")
            
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
  
        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
        // CHALLENGE 2: create button for user to change map type
        createMapTypeBtn()
    }
    
    func createMapTypeBtn() {
        let mapTypeBtn = UIButton(type: .system)
        mapTypeBtn.frame = CGRect(x: 5, y: 50, width: 150, height: 50)
        mapTypeBtn.backgroundColor = .gray
        
        mapTypeBtn.setTitle("Change view", for: .normal)
        mapTypeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        mapTypeBtn.addTarget(self, action: #selector(mapTypeBtnPressed), for: .touchUpInside)
        mapView.addSubview(mapTypeBtn)
    }
    
    @objc func mapTypeBtnPressed() {
        let mapTypeAlert = UIAlertController(title: "Select map type", message: nil, preferredStyle: .actionSheet)
        let mapType1 = UIAlertAction(title: "standard", style: .default) { action in
            self.mapView.mapType = .standard
        }
        let mapType2 = UIAlertAction(title: "satellite", style: .default) { action in
            self.mapView.mapType = .satellite
        }
        let mapType3 = UIAlertAction(title: "hybrid", style: .default) { action in
            self.mapView.mapType = .hybrid
        }
        let mapType4 = UIAlertAction(title: "satellite aerial", style: .default) { action in
            self.mapView.mapType = .satelliteFlyover
        }
        let mapType5 = UIAlertAction(title: "hybrid aerial", style: .default) { action in
            self.mapView.mapType = .hybridFlyover
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        
        mapTypeAlert.addAction(mapType1)
        mapTypeAlert.addAction(mapType2)
        mapTypeAlert.addAction(mapType3)
        mapTypeAlert.addAction(mapType4)
        mapTypeAlert.addAction(mapType5)
        mapTypeAlert.addAction(cancel)
        
        present(mapTypeAlert, animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        // CHALLENGE 1:
        annotationView?.markerTintColor = .green
        annotationView?.tintColor = .purple
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}

