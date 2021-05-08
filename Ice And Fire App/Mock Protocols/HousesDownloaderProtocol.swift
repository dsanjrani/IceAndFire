import Foundation

protocol HousesDownloaderProtocol {
    
    var result: Result<[House], Error>? { get set }
    var session: URLSessionProtocol { get set }
    
    func download(completionHandler: @escaping (Result<[House], Error>?) -> Void)
}
