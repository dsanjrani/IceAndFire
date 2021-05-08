import XCTest

class IceAndFireUITestCase: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments = ["enable_testing"]
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
}
