import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    
    var resumeCallCount: Int
    
    override init() {
        resumeCallCount = 0
    }
    
    override func resume() {
        resumeCallCount += 1
    }
}
