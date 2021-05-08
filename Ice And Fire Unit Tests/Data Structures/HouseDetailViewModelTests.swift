@testable import Ice_And_Fire_App
import XCTest

final class HouseDetailViewModelTests: XCTestCase {
    
    var sut: HouseDetailViewModel!
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_init_setsName() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        XCTAssertEqual(sut.name, "test_name")
    }
    
    // MARK: Validating Info Section "Titles"
    
    func test_init_forFilledTestHouse_setsInfoSectionTitles() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Titles" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionTitlesCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Titles" })
        XCTAssertEqual(infoSection?.info, "• title_1\n• title_2")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionTitles() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Titles" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Region"
    
    func test_init_forFilledTestHouse_setsInfoSectionRegion() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Region" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionRegionCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Region" })
        XCTAssertEqual(infoSection?.info, "test_region")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionRegion() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Region" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Words"
    
    func test_init_forFilledTestHouse_setsInfoSectionWords() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Words" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionWordsCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Words" })
        XCTAssertEqual(infoSection?.info, "test_words")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionWords() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Words" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Coat of Arms"
    
    func test_init_forFilledTestHouse_setsInfoSectionCoatOfArms() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Coat of Arms" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionCoatOfArmsCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Coat of Arms" })
        XCTAssertEqual(infoSection?.info, "test_coatOfArms")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionCoatOfArms() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Coat of Arms" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Seats"
    
    func test_init_forFilledTestHouse_setsInfoSectionSeats() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Seats" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionSeatsCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Seats" })
        XCTAssertEqual(infoSection?.info, "• seat_1\n• seat_2")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionSeats() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Seats" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Ancestral Weapons"
    
    func test_init_forFilledTestHouse_setsInfoSectionAncestralWeapons() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Ancestral Weapons" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionAncestralWeaponsCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Ancestral Weapons" })
        XCTAssertEqual(infoSection?.info, "• weapon_1\n• weapon_2")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionAncestralWeapons() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Ancestral Weapons" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Founded"
    
    func test_init_forFilledTestHouse_setsInfoSectionFounded() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Founded" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionFoundedCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Founded" })
        XCTAssertEqual(infoSection?.info, "test_founded")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionFounded() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Founded" })
        XCTAssertFalse(containsTitles)
    }
    
    // MARK: Validating Info Section "Died Out"
    
    func test_init_forFilledTestHouse_setsInfoSectionDiedOut() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let containsInfoSection = sut.infoSections.contains(where: { $0.title == "Died Out" })
        XCTAssertTrue(containsInfoSection)
    }
    
    func test_init_forFilledTestHouse_setsInfoSectionDiedOutCorrectly() {
        sut = HouseDetailViewModel(house: filledTestHouse)
        
        let infoSection = sut.infoSections.first(where: { $0.title == "Died Out" })
        XCTAssertEqual(infoSection?.info, "test_diedOut")
    }
    
    func test_init_forEmptyTestHouse_doesNotSetInfoSectionDiedOut() {
        sut = HouseDetailViewModel(house: emptyTestHouse)
        
        let containsTitles = sut.infoSections.contains(where: { $0.title == "Died Out" })
        XCTAssertFalse(containsTitles)
    }
}

private extension HouseDetailViewModelTests {
    
    var filledTestHouse: House {
        House(url: "test_url", name: "test_name", region: "test_region", coatOfArms: "test_coatOfArms", words: "test_words", titles: ["title_1", "title_2"], seats: ["seat_1", "seat_2"], currentLord: "test_lord", heir: "test_heir", overlord: "test_overlord", founded: "test_founded", founder: "test_founder", diedOut: "test_diedOut", ancestralWeapons: ["weapon_1", "weapon_2"], cadetBranches: ["branch_1", "branch_2"], swornMembers: ["member_1", "member_2"])
    }
    
    var emptyTestHouse: House {
        House(url: "", name: "", region: "", coatOfArms: "", words: "", titles: [""], seats: [""], currentLord: "", heir: "", overlord: "", founded: "", founder: "", diedOut: "", ancestralWeapons: [""], cadetBranches: [""], swornMembers: [""])
    }
}
