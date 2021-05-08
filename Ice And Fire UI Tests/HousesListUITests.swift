import XCTest

class HousesListUITests: IceAndFireUITestCase {

    func test_navigationView_exists() throws {
        let navigationViewExists = app.navigationBars.element.exists
        
        XCTAssertTrue(navigationViewExists)
    }
    
    func test_navigationView_titleIsSetCorrectly() throws {
        let navigationViewTitle = app.navigationBars.element.staticTexts.element.label
        
        XCTAssertEqual(navigationViewTitle, "Houses")
    }
    
    func test_list_exists() throws {
        let listExists = app.tables.element.exists
        
        XCTAssertTrue(listExists)
    }
    
    func test_list_showsHouseNames() throws {
        let cells = app.tables.element.children(matching: .cell)
        let firstCellsTitle = cells.element(boundBy: 0).buttons.element.label
        
        XCTAssertEqual(firstCellsTitle, "House Algood")
    }
    
    func test_list_linksToDetailView() throws {
        let cells = app.tables.element.children(matching: .cell)
        let firstCellsButton = cells.element(boundBy: 0).buttons.element
        
        firstCellsButton.tap()
    
        let detailViewExists = app.otherElements["House Details"].exists
        XCTAssertTrue(detailViewExists)
    }
}
