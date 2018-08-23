//
//  TextInputsManagerTests.swift
//  SKUtilsUITests
//
//  Created by Sergey on 23.08.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import XCTest
@testable import SKUtils

class TextInputsManagerTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWithView() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Text Inputs Manager View Example"]/*[[".cells.staticTexts[\"Text Inputs Manager View Example\"]",".staticTexts[\"Text Inputs Manager View Example\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier: "SKUtils.TextInputsManagerView").children(matching: .other).element
            .children(matching: .other).element.children(matching: .other).element
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let goButton = app/*@START_MENU_TOKEN@*/.buttons["Go"]/*[[".keyboards.buttons[\"Go\"]",".buttons[\"Go\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        goButton.tap()
        goButton.tap()
        element.tap()
        element.children(matching: .textField).element(boundBy: 2).tap()
        goButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }
    
    func testWithScroll() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Text Inputs Manager Scroll Example"]/*[[".cells.staticTexts[\"Text Inputs Manager Scroll Example\"]",".staticTexts[\"Text Inputs Manager Scroll Example\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.children(matching: .textField).element(boundBy: 0).tap()
        
        let nextButton = app/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"Next\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        nextButton.tap()
        nextButton.tap()
        app.otherElements.containing(.navigationBar, identifier: "SKUtils.TextInputsManagerView").children(matching: .other).element
            .children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
            .children(matching: .scrollView).element.tap()
        scrollViewsQuery.children(matching: .textField).element(boundBy: 2).tap()
        nextButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
}
