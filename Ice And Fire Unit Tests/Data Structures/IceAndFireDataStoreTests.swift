@testable import Ice_And_Fire_App
import XCTest

final class IceAndFireDataStoreTests: XCTestCase {
    
    var sut: IceAndFireDataStore!
    var mockHousesDownloader: MockHousesDownloader!
    
    override func setUp() {
        super.setUp()
        mockHousesDownloader = MockHousesDownloader()
        sut = IceAndFireDataStore()
        sut.housesDownloader = mockHousesDownloader
    }
    
    override func tearDown() {
        sut = nil
        mockHousesDownloader = nil
        super.tearDown()
    }

    func test_fetchNextPageOfHouses_shouldCallDownloadMethodOnce() {
        sut.fetchNextPageOfHouses()
        
        mockHousesDownloader.verifyDownloadCall()
    }
    
    func test_fetchNextPageOfHouses_shouldSaveDownloadedHousesInPublishedProperty() {
        let testHouses = TestData.houses
        let asyncExpectation = expectation(description: "async")
        sut.mainQueue = MockDispatchQueue(asyncCompletion: {
            XCTAssertEqual(self.sut.houses, testHouses)
            asyncExpectation.fulfill()
        })
        
        sut.fetchNextPageOfHouses()
        mockHousesDownloader.result = .success(testHouses)
        mockHousesDownloader.downloadArgsCompletionHandler.first?(mockHousesDownloader.result)
        wait(for: [asyncExpectation], timeout: 10)
    }
}
