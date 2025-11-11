import Foundation
import XCTest

class firstXcodeUITest: XCTestCase {
    let app = XCUIApplication()

    // MARK: - Tests

    func testLaunchAndTerminate() throws {
        app.launch()
        print("App launched---")
        app.terminate()
        print("App terminated---")
    }

    func testFindElement() throws {
        app.launch()
        XCTAssert(app.buttons["Text"].exists)
        print("Yes")
        XCTAssert(app.buttons["Alert"].exists)
        print("Yes")
    }

    func testREcordAndPlay() {
        let app = XCUIApplication()
        app.activate()
        app.buttons["Web View"].tap()
        sleep(5)
        app.buttons["UI Elements"].tap()
        app.buttons["Alert"].tap()
        sleep(5)
        app.buttons["OK"].tap()
    }

    func testDemoOne() {
        app.launch()
        print("App launched---")

        let tapAlert = app.staticTexts["Alert"]
        _ = tapAlert.waitForExistence(timeout: 5)
        tapAlert.firstMatch.tap()
        print("Alert Tapped")

        let buttonOK = app.buttons["OK"]
        _ = buttonOK.waitForExistence(timeout: 5)
        buttonOK.firstMatch.tap()
        print("Ok Tapped")

        let tapText = app.staticTexts["Text"]
        _ = tapText.waitForExistence(timeout: 5)
        tapText.firstMatch.tap()
        print("Text Tapped")

        let tapTextField = app.textFields["Enter a text"]
        _ = tapTextField.waitForExistence(timeout: 5)
        tapTextField.firstMatch.tap()
        tapTextField.typeText("My first test on swift")

        let btnBack = app.navigationBars["Sample_iOS.TextEditor"].buttons["UI Elements"]
        _ = btnBack.waitForExistence(timeout: 5)
        btnBack.firstMatch.tap()
    }

    func testDemoTwo() {
        app.launch()
        sleep(4)
        app.buttons["Web View"].tap()
        sleep(4)

        let talkButtons = app.buttons.matching(identifier: "Talk to us")
        let secondTalkButton = talkButtons.element(boundBy: 1)
        secondTalkButton.tap()

        sleep(4)
        app.terminate()
    }

    func testDemoThree() {
        app.launch()
        sleep(4)
        app.buttons["Web View"].firstMatch.tap()

        app.swipeUp()
        print("Page Swiped")

        app.swipeDown()
        print("Page Swiping down")

        app.swipeLeft()
        print("Page Swiping Left")

        app.swipeRight()
        print("Page Swiping Right")
    }

    func testDemoFour() {
        app.launch()

        let assertAlert = app.staticTexts["Alert"]
        XCTAssert(assertAlert.exists)

        let textPogo = app.textFields["POGO"]
        XCTAssert(!textPogo.exists)
    }

    func testSwipeRL() {
        app.launch()
        app.buttons["Web View"].firstMatch.tap()

        app.swipeUp()
        sleep(3)
        app.swipeDown()
        sleep(3)
        app.swipeLeft()
        app.swipeRight()
    }

    func testSimpleFrameWork() {
        app.launch()
        tapAlert()
        tapOK()
        tapText()
        enterText()
        backToHome()
        killTheApp()
    }
}

// MARK: - Helpers

extension firstXcodeUITest {
    func appLaunch() {
        app.launch()
    }

    func tapAlert() {
        let tapAlert = app.staticTexts["Alert"]
        _ = tapAlert.waitForExistence(timeout: 5)
        tapAlert.firstMatch.tap()
        print("Alert Tapped")
    }

    func tapOK() {
        let buttonOK = app.buttons["OK"]
        _ = buttonOK.waitForExistence(timeout: 5)
        buttonOK.firstMatch.tap()
        print("Ok Tapped")
    }

    func tapText() {
        let tapText = app.staticTexts["Text"]
        _ = tapText.waitForExistence(timeout: 5)
        tapText.firstMatch.tap()
        print("Text Tapped")
    }

    func enterText() {
        let tapTextField = app.textFields["Enter a text"]
        _ = tapTextField.waitForExistence(timeout: 5)
        tapTextField.firstMatch.tap()
        tapTextField.typeText("My first test on swift")
    }

    func backToHome() {
        let btnBack = app.navigationBars["Sample_iOS.TextEditor"].buttons["UI Elements"]
        _ = btnBack.waitForExistence(timeout: 5)
        btnBack.firstMatch.tap()
    }

    func killTheApp() {
        app.terminate()
    }

    func testDemoFive() {
        app.launch()
        let alert = app.staticTexts["Alert"]
        if alert.exists {
            print("Alert is available")
            alert.tap()
            sleep(5)
        } else {
            print("Alert is not present")
        }
    }

    func testDemoFiveOne() {
        app.launch()
        let pogo = app.staticTexts["Pogo"]
        if pogo.exists {
            print("pogo is available")
            pogo.tap()
            sleep(5)
        } else {
            print("pogo is not present")
        }
    }

    func testDemoFiveTwo() {
        app.launch()
        let pogo = app.staticTexts["Pogo"]
        let zogo = app.staticTexts["Zogo"]

        if pogo.exists {
            print("pogo is available")
            pogo.tap()
            sleep(5)
        } else if zogo.exists {
            print("zogo is present")
        }
    }

    func testDemoSix() {
        app.launch()

        for index in 1...5 {
            print("\(index)times 5 is \(index * 5)")
            app.staticTexts["Alert"].firstMatch.tap()
            app.buttons["OK"].firstMatch.tap()
        }

        app.buttons["Web View"].firstMatch.tap()

        for _ in 1...3 {
            print("printing again")
            app.swipeUp()
        }

        let text = app.staticTexts["See our Customers"]
        while !text.exists {
            app.swipeUp()
        }
    }

    func testDemoSeven() {
        app.launch()
        let tapAlert = "Alert"
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", tapAlert)
        app.staticTexts.containing(predicate).firstMatch.tap()
        print("Alert Tapped--------")
    }
}
