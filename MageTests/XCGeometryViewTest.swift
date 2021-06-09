//
//  XCGeometryViewTest.swift
//  MAGETests
//
//  Created by Daniel Barela on 6/9/21.
//  Copyright © 2021 National Geospatial Intelligence Agency. All rights reserved.
//

import XCTest
import MapKit

@testable import MAGE

class XCGeometryViewTest: XCTestCase {
    
    var geometryFieldView: GeometryView!
    var controller: UIViewController! = UIViewController()
    var window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    override func setUpWithError() throws {
        window.rootViewController = controller;
        window.makeKeyAndVisible()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let expectation: XCTestExpectation = self.expectation(description: "...")
        
        let plainDelegate: PlainMapViewDelegate = PlainMapViewDelegate();
        
        plainDelegate.mapDidFinishRenderingClosure = { mapView, fullyRendered in
            print("Map finished rendering")
            expectation.fulfill()
        }
        geometryFieldView = GeometryView(mkmapDelegate: plainDelegate);
        
        controller.view = geometryFieldView;
        
        let result: XCTWaiter.Result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        XCTAssertEqual(result, .completed)
    }

}
