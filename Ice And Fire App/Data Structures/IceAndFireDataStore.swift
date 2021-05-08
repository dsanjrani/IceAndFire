import Foundation
import os

class IceAndFireDataStore: ObservableObject {
    
    var housesDownloader: HousesDownloaderProtocol = HousesDownloader()
    var mainQueue: DispatchQueueProtocol = DispatchQueue.main
    @Published var houses: [House] = [House]()
    
    func fetchNextPageOfHouses() {
        guard !isRunningUITests else {
            configureDatastoreForUITesting()
            return
        }
        
        housesDownloader.download { [weak self] _ in
            self?.processResultOfHousedDownloader()
        }
    }
    
    private func processResultOfHousedDownloader() {
        do {
            guard let downloadedHouses = try housesDownloader.result?.get() else { return }
            publish(downloadedHouses)
        } catch {
            Logger().error("Couldn't get result of HousesDownloader with error description: \(error.localizedDescription)")
        }
    }
    
    private func publish(_ downloadedHouses: [House]) {
        mainQueue.async(group: nil, qos: .unspecified, flags: []) {
            self.houses.append(contentsOf: downloadedHouses)
        }
    }
    
    // MARK: UI Testing Configuration
    
    private var isRunningUITests: Bool {
        #if DEBUG
        return CommandLine.arguments.contains("enable_testing")
        #else
        return false
        #endif
    }
    
    private func configureDatastoreForUITesting() {
        guard houses.count == 0 else { return }
        loadPreviewContent()
    }
}
