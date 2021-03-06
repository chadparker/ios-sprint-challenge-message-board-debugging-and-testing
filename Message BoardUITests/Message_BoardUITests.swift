//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testNewMessageSend() {
        
        app.tables.element(boundBy: 0).textFields["Create a new thread:"].tap()

        type("hey")
        app.buttons["Return"].tap()
        
        app.tables.cells.staticTexts["hey"].tap()
        app.navigationBars["hey"].buttons["Add"].tap()
        
        app.textFields["nameText"].tap()
        type("chad")
        
        app.textViews["messageText"].tap()
        type("Hey")
        
        app.navigationBars["New Message"].buttons["Send"].tap()
        
        XCTAssert(app.tables.cells.staticTexts["Hey"].exists)
    }
    
    func type(_ text: String) {
        text.forEach { character in
            app.keys[String(character)].tap()
        }
    }
}
