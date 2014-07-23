//
//  GRJenkinsAPIClientTests.swift
//  Jenkins
//
//  Created by Garrett Richards on 7/22/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

import UIKit
import Foundation
import XCTest


class GRJenkinsAPIClientTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProjectListFetch()
    {
        var client:GRJenkinsAPIClient = GRJenkinsAPIClient()
        
        self.measureBlock(){
            client.getProjectList(nil)
        }
    }

}
