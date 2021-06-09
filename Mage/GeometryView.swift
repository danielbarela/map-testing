//
//  GeometryView.swift
//  MapTesting (iOS)
//
//  Created by Daniel Barela on 6/8/21.
//

import Foundation
import MapKit

class GeometryView: UIView {
    private var mkmapDelegate: MKMapViewDelegate?;
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView();
        mapView.translatesAutoresizingMaskIntoConstraints = false

        mapView.mapType = .standard;
        mapView.delegate = mkmapDelegate;
        return mapView;
    }()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    init(mkmapDelegate: MKMapViewDelegate? = nil) {
        super.init(frame: CGRect.zero);
        self.mkmapDelegate = mkmapDelegate
        self.addSubview(mapView);
        
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
}
