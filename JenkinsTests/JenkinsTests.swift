//
//  JenkinsTests.swift
//  JenkinsTests
//
//  Created by Garrett Richards on 6/23/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

import XCTest


class JenkinsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveInstance()
    {
        var ds =  GRInstanceDataSource()
        
        var model =  GRInstanceModel(name:"test", host:"test")
        
        ds.saveInstance(model)
        
        var found = false
        
        for(key,val) in ds.instances
        {
            if(key.compare(model.host) == 0)
            {
                found = true
            }
        }
        
        XCTAssertTrue(found, "unable to find model")
        
    }
    
    func testLoadOfInstances()
    {
        var ds =  GRInstanceDataSource()
        
        var model =  GRInstanceModel(name:"test", host:"test")
        
        ds.saveInstance(model)
        
        var found = false
        
        for(key,val) in ds.instances
        {
            if(key.compare(model.host) == 0)
            {
                found = true
            }
        }
        
        XCTAssertTrue(found, "unable to find model")
        
        var ds2 = GRInstanceDataSource()
        var savedModel = ds2.instances["test"]
        XCTAssertNotNil(savedModel, "model is nil and should not be")
        
    }
    
    func testRemoveInstance()
    {
        var ds =  GRInstanceDataSource()
        var model =  GRInstanceModel(name:"test", host:"test")
        ds.saveInstance(model)
        ds.removeInstanceForKey("test")
        

        var ds2 = GRInstanceDataSource()
        var savedModel = ds2.instances["test"]
        XCTAssertNil(savedModel, "model is nil and should not be")
    }
    
    
    
}
