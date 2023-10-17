//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by Mohammad Miah on 16/10/2023.
//

import XCTest

@testable import Flickr
final class FlickrTests: XCTestCase {
    
    var viewModel: ViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    //Valid ID
//    func testGetPhotosOfValidID() {
//        let id = "16725484@N03"
//        XCTAssertNoThrow(viewModel.getPhotosOf(userID: id))
//    }
//


}
