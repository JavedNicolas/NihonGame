//
//  LanguageTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class LanguageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGivenWeWantTheGameInEnglishThenTheLaguageIsInEnglish() {
        Text.shared.setCurrentLanguage(lang: .en)

        XCTAssertEqual(AppDelegate.delegate.textLanguage?.lang, "English")
    }
    
}
