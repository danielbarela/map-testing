//
//  PlainMapViewDelegate.swift
//  MAGE
//
//  Created by Daniel Barela on 6/9/21.
//  Copyright © 2021 National Geospatial Intelligence Agency. All rights reserved.
//

import Foundation
import MapKit

class PlainMapViewDelegate: NSObject, MKMapViewDelegate {
    
    var mapDidStartLoadingMapClosure: ((MKMapView) -> Void)?
    var mapDidFinishLoadingClosure: ((MKMapView) -> Void)?
    var mapDidFinishRenderingClosure: ((MKMapView, Bool) -> Void)?
    var mapDidAddOverlayViewsClosure: ((MKMapView) -> Void)?
    var regionDidChangeAnimatedClosure: ((MKMapView) -> Void)?
        
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        NSLog("Start Loading map")
        mapDidStartLoadingMapClosure?(mapView);
    }
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        NSLog("Finish Loading map")
        mapDidFinishLoadingClosure?(mapView)
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        NSLog("Finish rendering map")
        mapDidFinishRenderingClosure?(mapView, fullyRendered);
    }
    
    func mapView(_ mapView: MKMapView, didAddOverlayViews overlayViews: [Any]) {
        NSLog("Did Add Overlay Views")
        mapDidAddOverlayViewsClosure?(mapView);
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        NSLog("Region did change")
        regionDidChangeAnimatedClosure?(mapView)
    }
    
}
