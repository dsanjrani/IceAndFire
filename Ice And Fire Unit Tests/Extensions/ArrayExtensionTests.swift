@testable import Ice_And_Fire_App
import XCTest

final class ArrayExtensionTests: XCTestCase {

    func test_tenthFromLast_returnsNilWhenArrayTooSmall() {
        let sut = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        XCTAssertNil(sut.tenthFromLast)
    }
    
    func test_tenthFromLast_returnsFirstElementWhenArrayHoldsElevenElements() {
        let sut = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        
        XCTAssertEqual(sut.tenthFromLast, 1)
    }
    
    func test_tenthFromLast_returnsThirdElementWhenArrayHoldsThirteenElements() {
        let sut = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        
        XCTAssertEqual(sut.tenthFromLast, 3)
    }
}
