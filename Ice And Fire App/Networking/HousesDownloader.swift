import Foundation

class HousesDownloader: HousesDownloaderProtocol {
    
    var result: Result<[House], Error>?
    var session: URLSessionProtocol = URLSession.shared
    private var currentPage: Int = 1
    private var reachedLastPage: Bool = false
    
    func download(completionHandler: @escaping (Result<[House], Error>?) -> Void) {
        guard let urlRequest = urlRequest(),
              !reachedLastPage else { return }
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            self.processResponse(with: data, and: error)
            completionHandler(self.result)
        }
        
        dataTask.resume()
        currentPage += 1
    }
    
    // MARK: URL Creation
    
    private func urlRequest() -> URLRequest? {
        guard let url = url() else { return nil }
        return URLRequest(url: url)
    }
    
    private func url() -> URL? {
        var components = URLComponents()
        components.scheme = NetworkingConstant.apiScheme
        components.host = NetworkingConstant.apiHost
        components.path = NetworkingConstant.apiPathHouses
        components.queryItems = [
            URLQueryItem(name: NetworkingConstant.apiParameterNamePageSize, value: NetworkingConstant.apiParameterValuePageSizeHouses),
            URLQueryItem(name: NetworkingConstant.apiParameterNamePage, value: "\(currentPage)")
        ]
        return components.url
    }
    
    // MARK: Response Processing
    
    private func processResponse(with data: Data?, and error: Error?) {
        if let data = data {
            processResponse(withData: data)
        } else if let error = error {
            self.result = .failure(error)
        }
    }
    
    private func processResponse(withData data: Data) {
        if let decodedHouses = try? JSONDecoder().decode([House].self, from: data) {
            self.result = .success(decodedHouses)
            checkForLastPage(with: decodedHouses.count)
        }
    }
    
    private func checkForLastPage(with count: Int) {
        self.reachedLastPage = (count == 0)
    }
}
