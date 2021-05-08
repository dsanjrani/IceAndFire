@testable import Ice_And_Fire_App
import XCTest

class HouseRowUITests: IceAndFireUITestCase {

    func test_label_isSetToHouseName() throws {
        let cells = app.tables.element.children(matching: .cell)
        let firstCellsTitle = cells.element(boundBy: 0).buttons.element.label
        XCTAssertEqual(firstCellsTitle, "House Algood")
    }
}
