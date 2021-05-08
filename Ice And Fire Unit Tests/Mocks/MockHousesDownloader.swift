@testable import Ice_And_Fire_App
import XCTest
import Foundation

class MockHousesDownloader: HousesDownloaderProtocol {
    
    var result: Result<[House], Error>?
    var session: URLSessionProtocol = MockURLSession()
    var downloadCallCount = 0
    var downloadArgsCompletionHandler: [(Result<[House], Error>?) -> Void] = []
    
    func download(completionHandler: @escaping (Result<[House], Error>?) -> Void) {
        downloadCallCount += 1
        downloadArgsCompletionHandler.append(completionHandler)
    }
    
    func verifyDownloadCall(file: StaticString = #file, line: UInt = #line) {
        let wasCalledOnce = downloadWasCalledOnce(file: file, line: line)
        XCTAssertTrue(wasCalledOnce, file: file, line: line)
    }
    
    private func downloadWasCalledOnce(file: StaticString = #file, line: UInt = #line) -> Bool {
        verifyMethodCalledOnce(methodName: "download(completionHandler:)", callCount: downloadCallCount, describeArguments: "", file: file, line: line)
    }
}
