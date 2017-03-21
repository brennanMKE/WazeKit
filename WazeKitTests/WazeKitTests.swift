//
//  WazeKitTests.swift
//  WazeKitTests
//
//  Created by Brennan Stehling on 3/20/17.
//  Copyright © 2017 SmallSharpTools LLC. All rights reserved.
//

import XCTest
@testable import WazeKit

class WazeKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAppConfiguration() {
        let wazeLauncher = WazeLauncher()
        XCTAssertTrue(wazeLauncher.configurationIsValid)
    }
    
}
