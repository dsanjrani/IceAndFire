import SwiftUI

@main
struct IceAndFireApp: App {
    
    @StateObject var iceAndFireDataStore = IceAndFireDataStore()
    
    var body: some Scene {
        WindowGroup {
            HousesList(dataStore: iceAndFireDataStore)
                .onAppear() {
                    iceAndFireDataStore.fetchNextPageOfHouses()
                }
        }
    }
}
