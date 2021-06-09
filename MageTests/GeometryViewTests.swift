//
//  GeometryViewTests.swift
//  Tests iOS
//
//  Created by Daniel Barela on 6/8/21.
//

import Foundation
import Quick
import Nimble
import MapKit

@testable import MAGE

class GeometryViewTests: QuickSpec {
    
    override func spec() {
        
        describe("GeometryView") {
            var geometryFieldView: GeometryView!
            var controller: UIViewController!
            var window: UIWindow!;
            
            window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
            
            controller = UIViewController();
            
            window.rootViewController = controller;
            window.makeKeyAndVisible()
            
            it("edit mode reference image") {
                var completeTest = false;
                let expectation: XCTestExpectation = self.expectation(description: "...")

                let plainDelegate: PlainMapViewDelegate = PlainMapViewDelegate();

                plainDelegate.mapDidFinishRenderingClosure = { mapView, fullyRendered in
                    print("Map finished rendering")
                    completeTest = true;
                    expectation.fulfill()
                }
                geometryFieldView = GeometryView(mkmapDelegate: plainDelegate);
                
                controller.view = geometryFieldView;
                
                self.waitForExpectations(timeout: 5.0) { error in
                    print("waited too long");
                }
                
                
//                expect(completeTest).to(beTrue());//, timeout: DispatchTimeInterval.seconds(10), pollInterval: DispatchTimeInterval.seconds(1), description: "Waiting for the map to render");
            }
        }
    }
}
