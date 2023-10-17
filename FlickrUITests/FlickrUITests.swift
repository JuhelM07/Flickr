//
//  FlickrUITests.swift
//  FlickrUITests
//
//  Created by Mohammad Miah on 16/10/2023.
//

import XCTest

@testable import Flickr
final class FlickrUITests: XCTestCase {

    var mainView: ContentView!

    override func setUp() {
        super.setUp()
        mainView = ContentView()
    }

    override func tearDownWithError() throws {
        mainView = nil
    }
    
    //test default search of Yorkshire
    func testSearchBar() {
        let searchText = mainView.searchText
        XCTAssertEqual(searchText, "Yorkshire")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
