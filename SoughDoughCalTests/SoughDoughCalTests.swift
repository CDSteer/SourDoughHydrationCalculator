//
//  SoughDoughCalTests.swift
//  SoughDoughCalTests
//
//  Created by Cameron Steer on 17/06/2017.
//  Copyright © 2017 Cameron Steer. All rights reserved.
//

import XCTest
@testable import SoughDoughCal

class SoughDoughCalTests: XCTestCase {
    let vc = ViewController()
    override func setUp() {
        super.setUp()
        vc.flour = 350
        vc.water = 210
        vc.starter = 120
        vc.starterHydration = 100
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCalHyrdation() {
        let testValue:Float = vc.calHyrdation()
        print(testValue)
        let actualValue:Float = (((210 + 60) / (350 + 60))*100)
        print(actualValue)
        XCTAssertEqual(round(testValue), round(actualValue))
        XCTAssertEqual(round(testValue), 66)
        
    }
    
    func testGetStarterFlour() {
        let testValue:Float = vc.getStarterFlour()
        XCTAssertEqual(testValue, 60)
        
    }
    func testGetStarterWater() {
        let testValue:Float = vc.getStarterWater()
        XCTAssertEqual(testValue, 60)
        
    }
    
    func testCalSalt(){
        let testValue:Float = vc.calSalt()
        XCTAssertEqual(testValue, 7)
    }
    
    func testCalWeigh(){
        let testValue:Float = vc.calWeight()
        XCTAssertEqual(testValue, 680)
    }
    
}
