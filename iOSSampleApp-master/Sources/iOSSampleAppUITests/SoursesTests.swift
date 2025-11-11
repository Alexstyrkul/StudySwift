//
//  TestsOSLaunchTests.swift
//  TestsOS
//
//  Created by oleksandr on 07.11.2025.
//  Copyright © 2025 Igor Kulman. All rights reserved.
//

import XCTest

class soursesTests: XCTestCase {
    
    let app = XCUIApplication()
    
    public func applaunch() {
        app.launchArguments = ["UITests"]
        app.launch()
        
    }
    public func appTerminate() {
        app.terminate()
    }
    
    public func testChoiseSourse() {
        
        let SelectSourseTitle = app.staticTexts["Select source"]
        XCTAssert(SelectSourseTitle.waitForExistence(timeout: 2))
        
        let ChoiseSourseHackerNews = app.staticTexts["Hacker News"]
        ChoiseSourseHackerNews.firstMatch.tap()
        
        let TapDoneButton = app.buttons["Done"]
        TapDoneButton.firstMatch.tap()
        
        let HakersNewsTitle = app.staticTexts["Hacker News"]
        XCTAssert(HakersNewsTitle.waitForExistence(timeout: 2))
        
        let gearButton = app.navigationBars["Hacker News"].buttons.element(boundBy: 0)
        gearButton.firstMatch.tap()
        
    }
    public func testOpenCustomSourse(){
        
        let tapOnAddCuctomSourseButton = app.buttons["Add custom"]
        tapOnAddCuctomSourseButton.firstMatch.tap()
        
        let AddCustomSourseTitle = app.staticTexts["Add custom source"]
        XCTAssert(AddCustomSourseTitle.waitForExistence(timeout: 2))
        
    }
    public func testAddCustomSourse() {
        let TaptitleField = app.textFields.element(boundBy: 0)
        TaptitleField.firstMatch.tap()
        TaptitleField.typeText("Add from AUtamation Test")
        
        let tapWrongUrl = app.textFields.element(boundBy: 1)
        tapWrongUrl.firstMatch.tap()
        tapWrongUrl.typeText("dfdffdfdfddfdff")
        tapWrongUrl.tap()
        if let text = tapWrongUrl.value as? String {
            for _ in 0..<1 {
                app.keys["delete"].tap()
            }
            let tapUrl = app.textFields.element(boundBy: 1)
            tapUrl.firstMatch.tap()
            tapUrl.typeText("https://github.com/wikimedia/wikipedia-ios?utm_source=chatgpt.com")
            
            let tapRssUrl = app.textFields.element(boundBy: 2)
            tapRssUrl.firstMatch.tap()
            tapRssUrl.typeText("https://github.com/wikimedia/wikipedia-ios?utm_source=chatgpt.com")
            
            let TapDoneButton = app.buttons["Done"]
            TapDoneButton.firstMatch.tap()
            sleep(2)
            
            
            let textTitle = app.staticTexts["Add from AUtamation Test"]
            XCTAssert(textTitle.exists, " ❌ Текст 'Select source' не найден на экране")
            
            
        }
        
        
        
    }
    
}
