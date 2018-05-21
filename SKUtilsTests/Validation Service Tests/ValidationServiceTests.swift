//
//  ValidationServiceTests.swift
//  SKUtilsTests
//
//  Created by Sergey on 21.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import XCTest
@testable import SKValidationService

class ValidationServiceTests: XCTestCase {
    
    private var validationService: DefaultValidationService!
    
    override func setUp() {
        super.setUp()
        validationService = DefaultValidationService()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validationService = nil
        super.tearDown()
    }
    
    // MARK: - Tests -
    
    func testCompoundRulesNegative() {
        let result = test(text: "Test1", compoundRules: true)
        XCTAssertFalse(result, "should not be true")
    }
    
    func testCompoundRulesPositive() {
        let result = test(text: "Test1234", compoundRules: true)
        XCTAssertTrue(result, "should not be false")
    }
    
    func testNotCompoundRulesNegative() {
        let result = test(text: "Test", compoundRules: false)
        XCTAssertFalse(result, "should not be true")
    }

    func testNotCompoundRulesPositive() {
        let result = test(text: "Test1", compoundRules: false)
        XCTAssertTrue(result, "should not be false")
    }
    
    // MARK: - Private -
    
    private func test(text: String, compoundRules: Bool) -> Bool {
        let lengthRule = LengthRule(minLength: 8, maxLength: 20)
        let regularRule = RegularExpressionRule(predicateFormat: "SELF MATCHES %@",
                                                regularExpression: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$")
        return validationService.validate(text: text, with: [lengthRule, regularRule], compoundRules: compoundRules)
    }
    
}
