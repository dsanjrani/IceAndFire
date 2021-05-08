@testable import Ice_And_Fire_App
import XCTest

final class HousesDownloaderTests: XCTestCase {
    
    var sut: HousesDownloader!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        sut = HousesDownloader()
        sut.session = mockURLSession
    }
    
    override func tearDown() {
        mockURLSession = nil
        sut = nil
        super.tearDown()
    }

    func test_download_shouldCallDataTaskMethodOnce() {
        sut.download(completionHandler: { result in return })
        
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://anapioficeandfire.com/api/houses?pageSize=25&page=1")!))
    }
    
    func test_download_shouldIncrementPagination() {
        sut.download(completionHandler: { result in return })
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://anapioficeandfire.com/api/houses?pageSize=25&page=1")!))
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
        
        sut.download(completionHandler: { result in return })
        
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://anapioficeandfire.com/api/houses?pageSize=25&page=2")!))
    }
    
    func test_download_shouldNotCallDataTaskMethodAfterReceivingEmptyResponse() {
        sut.download(completionHandler: { result in return })
        mockURLSession.dataTaskArgsCompletionHandler.first?(emptyTestJSONData(), nil, nil)
        
        sut.download(completionHandler: { result in return })
        
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://anapioficeandfire.com/api/houses?pageSize=25&page=1")!))
    }
    
    func test_download_shouldCallResumeOnDataTask() {
        sut.download(completionHandler: { result in return })
        
        XCTAssertEqual(mockURLSession.dataTask!.resumeCallCount, 1)
    }
    
    func test_download_withSuccessResponse_shouldSaveDataInResultCorrectly() {
        sut.download { result in
            do {
                let house = try result!.get().first!
                self.verifyTestJSONData(for: house)
            } catch {
                XCTFail("Failed to get result")
            }
        }
        
        mockURLSession.dataTaskArgsCompletionHandler.first?(testJSONData(), nil, nil)
    }
    
    func test_download_withError_shouldSaveErrorInResult() {
        sut.download { result in
            switch result {
            case let .failure(error):
                XCTAssertEqual((error as! TestError).message, "oh no")
            default:
                XCTFail("Failed to throw error")
            }
        }
        
        mockURLSession.dataTaskArgsCompletionHandler.first?(nil, nil, TestError(message: "oh no"))
    }
}

private extension HousesDownloaderTests {
    
    func testJSONData() -> Data {
        return """
        [
          {
            "url": "https://anapioficeandfire.com/api/houses/10",
            "name": "House Baelish of Harrenhal",
            "region": "The Riverlands",
            "coatOfArms": "A field of silver mockingbirds, on a green field(Vert, semé of mockingbirds argent)",
            "words": "Never Resting",
            "titles": [
              "Lord Paramount of the Trident",
              "Lord of Harrenhal"
            ],
            "seats": [
              "Harrenhal"
            ],
            "currentLord": "https://anapioficeandfire.com/api/characters/823",
            "heir": "https://anapioficeandfire.com/api/characters/477",
            "overlord": "https://anapioficeandfire.com/api/houses/16",
            "founded": "299 AC",
            "founder": "https://anapioficeandfire.com/api/characters/823",
            "diedOut": "",
            "ancestralWeapons": [
              ""
            ],
            "cadetBranches": [
              "https://anapioficeandfire.com/api/houses/6"
            ],
            "swornMembers": [
              "https://anapioficeandfire.com/api/characters/651",
              "https://anapioficeandfire.com/api/characters/804",
              "https://anapioficeandfire.com/api/characters/823",
              "https://anapioficeandfire.com/api/characters/957",
              "https://anapioficeandfire.com/api/characters/970"
            ]
          }
        ]
        """.data(using: .utf8)!
    }
    
    func emptyTestJSONData() -> Data {
        return """
        [
        ]
        """.data(using: .utf8)!
    }
    
    func verifyTestJSONData(for house: House) {
        XCTAssertEqual(house.url, "https://anapioficeandfire.com/api/houses/10", "url")
        XCTAssertEqual(house.name, "House Baelish of Harrenhal", "name")
        XCTAssertEqual(house.region, "The Riverlands", "region")
        XCTAssertEqual(house.coatOfArms, "A field of silver mockingbirds, on a green field(Vert, semé of mockingbirds argent)", "coatOfArms")
        XCTAssertEqual(house.words, "Never Resting", "words")
        XCTAssertEqual(house.titles, ["Lord Paramount of the Trident", "Lord of Harrenhal"], "titles")
        XCTAssertEqual(house.seats, ["Harrenhal"], "seats")
        XCTAssertEqual(house.currentLord, "https://anapioficeandfire.com/api/characters/823", "currentLord")
        XCTAssertEqual(house.heir, "https://anapioficeandfire.com/api/characters/477", "heir")
        XCTAssertEqual(house.overlord, "https://anapioficeandfire.com/api/houses/16", "overlord")
        XCTAssertEqual(house.founded, "299 AC", "founded")
        XCTAssertEqual(house.founder, "https://anapioficeandfire.com/api/characters/823", "founder")
        XCTAssertEqual(house.diedOut, "", "diedOut")
        XCTAssertEqual(house.ancestralWeapons, [""], "ancestralWeapons")
        XCTAssertEqual(house.cadetBranches, ["https://anapioficeandfire.com/api/houses/6"], "cadetBranches")
        XCTAssertEqual(house.swornMembers, ["https://anapioficeandfire.com/api/characters/651", "https://anapioficeandfire.com/api/characters/804", "https://anapioficeandfire.com/api/characters/823", "https://anapioficeandfire.com/api/characters/957", "https://anapioficeandfire.com/api/characters/970"], "swornMembers")
    }
}
