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
    
    var sourDough: SourDough!
    var sourDoughZero: SourDough!
    
    override func setUp() {
        super.setUp()
        sourDough = SourDough(flour: 350, water: 210, starter: 120, starterHydration: 100)
        sourDoughZero = SourDough(flour: 0, water: 0, starter: 0, starterHydration: 0)
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
        let testValue: Float = sourDough.calHyrdation()
        let actualValue: Float = ((210 + 60) / (350 + 60))*100
        XCTAssertEqual(round(testValue), round(actualValue))
        XCTAssertEqual(round(testValue), 66)
        XCTAssertEqual(sourDoughZero.calHyrdation(), 0)
    }

    func testGetStarterFlour() {
        let testValue: Float = sourDough.getStarterFlour()
        XCTAssertEqual(testValue, 60)
    }

    func testGetStarterWater() {
        let testValue: Float = sourDough.getStarterWater()
        XCTAssertEqual(testValue, 60)
    }

    func testCalSalt() {
        let testValue: Float = sourDough.calSalt()
        XCTAssertEqual(testValue, 7)
    }

    func testCalWeigh() {
        let testValue: Float = sourDough.calWeight()
        XCTAssertEqual(testValue, 680)
    }
    
}
