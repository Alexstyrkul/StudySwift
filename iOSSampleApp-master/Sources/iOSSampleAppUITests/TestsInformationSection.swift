import XCTest

class InformationSectionTests: XCTestCase {
    
    let app = XCUIApplication()
    
    public func applaunch() {
        app.launchArguments = ["UITests"]
        app.launch()
        
    }
    public func appTerminate() {
        app.terminate()
    }
    public func testNavigationsOnSection() {
        let SelectSourseTitle = app.staticTexts["Select source"]
        XCTAssert(SelectSourseTitle.waitForExistence(timeout: 2))
        
        let ChoiseSourseHackerNews = app.staticTexts["Hacker News"]
        ChoiseSourseHackerNews.firstMatch.tap()
        
        let TapDoneButton = app.buttons["Done"]
        TapDoneButton.firstMatch.tap()
        
        let tapAboutButton = app.buttons["about"]
        tapAboutButton.firstMatch.tap()
        XCTAssertTrue(app.staticTexts["About"].waitForExistence(timeout: 2),"About title not found")
        
        
        let tapUsedLibrarwsButton = app.staticTexts["Used libraries"]
        tapUsedLibrarwsButton.firstMatch.tap()
        XCTAssertTrue(app.staticTexts["Used libraries"].waitForExistence(timeout: 2),"Used libraries title not found")
        let BackToAboutButton = app.navigationBars["Used libraries"].buttons["About"]
        BackToAboutButton.firstMatch.tap()
        
        let aboutAuthor = app.staticTexts["About author"]
        aboutAuthor.tap()
        let doneButton = app.descendants(matching: .button)
            .matching(NSPredicate(format: "label == 'Done'"))
            .firstMatch
        XCTAssertTrue(app.staticTexts["Igor Kulman"].waitForExistence(timeout: 5), "Author page not loaded")
        XCTAssertTrue(doneButton.waitForExistence(timeout: 8), "Done not found")
        let coord = doneButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        coord.tap()
        XCTAssertTrue(app.navigationBars["About"].waitForExistence(timeout: 5), "About screen didn't reappear")
        
        let tapAphtorBlogButt = app.staticTexts["Author\'s blog"]
        tapAphtorBlogButt.firstMatch.tap()
        let DoneButton = app.descendants(matching: .button)
            .matching(NSPredicate(format: "label == 'Done'"))
            .firstMatch
        XCTAssertTrue(DoneButton.waitForExistence(timeout: 8), "Done not found")
        let cord = DoneButton.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        cord.tap()
        XCTAssertTrue(app.navigationBars["About"].waitForExistence(timeout: 5), "About screen didn't reappear")
        let BackToSourseButton = app.navigationBars["About"].buttons["Back"]
        BackToSourseButton.firstMatch.tap()
        
    }
}
