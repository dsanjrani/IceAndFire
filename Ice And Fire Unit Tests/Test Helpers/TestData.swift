@testable import Ice_And_Fire_App
import Foundation

struct TestData {
    
    static var houses: [House] {
        let dataStore = IceAndFireDataStore()
        dataStore.loadPreviewContent()
        return dataStore.houses
    }
}
