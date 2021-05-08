import XCTest

class HouseDetailUITests: IceAndFireUITestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        let cells = app.tables.element.children(matching: .cell)
        let firstCellsButton = cells.element(boundBy: 0).buttons.element
        firstCellsButton.tap()
    }

    func test_navigationView_titleIsSetCorrectly() throws {
        let navigationViewTitle = app.navigationBars.element.staticTexts.element.label
        
        XCTAssertEqual(navigationViewTitle, "House Algood")
    }
    
    func test_list_exists() throws {
        let listExists = app.tables.element.exists
        
        XCTAssertTrue(listExists)
    }
    
    func test_list_showsHouseDetailRegion() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 0).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 0).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Titles")
        XCTAssertEqual(detailValue, "• King of Mountain and Vale (formerly)\n• Lord of the Eyrie\n• Defender of the Vale\n• Warden of the East")
    }
    
    func test_list_showsHouseDetailTitles() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 1).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 1).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Region")
        XCTAssertEqual(detailValue, "The Westerlands")
    }
    
    func test_list_showsHouseDetailWords() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 2).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 2).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Words")
        XCTAssertEqual(detailValue, "No Foe May Pass")
    }
    
    func test_list_showsHouseDetailCoatOfArms() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 3).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 3).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Coat of Arms")
        XCTAssertEqual(detailValue, "A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)")
    }
    
    func test_list_showsHouseDetailSeats() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 4).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 4).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Seats")
        XCTAssertEqual(detailValue, "• Gulltown")
    }
    
    func test_list_showsHouseDetailAncestralWeapons() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 5).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 5).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Ancestral Weapons")
        XCTAssertEqual(detailValue, "• some weapon")
    }
    
    func test_list_showsHouseDetailFounded() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 6).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 6).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Founded")
        XCTAssertEqual(detailValue, "Coming of the Andals")
    }
    
    func test_list_showsHouseDetailDiedOut() throws {
        let cells = app.tables.element.children(matching: .cell)
        let detailTitle = cells.element(boundBy: 7).staticTexts.element(boundBy: 0).label
        let detailValue = cells.element(boundBy: 7).staticTexts.element(boundBy: 1).label

        XCTAssertEqual(detailTitle, "Died Out")
        XCTAssertEqual(detailValue, "666")
    }
}
