import XCTest

class TestsMain: XCTestCase {
    
    let SoursesTests = soursesTests()
    let TestsInformationSection = InformationSectionTests()
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.terminate()
        app.launchArguments = ["UITests"]
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
    
    func testSourses() {
        SoursesTests.testChoiseSourse()
        SoursesTests.testOpenCustomSourse()
        SoursesTests.testAddCustomSourse()
    }
    func testNavigationsOnSection() {
        TestsInformationSection.testNavigationsOnSection()
    }
    
}
