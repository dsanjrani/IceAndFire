import SwiftUI

struct HousesList: View {
    
    @ObservedObject var dataStore: IceAndFireDataStore
    
    var body: some View {
        NavigationView {
            List(dataStore.houses, id: \.name) { house in
                NavigationLink(destination: HouseDetail(viewModel: HouseDetailViewModel(house: house))) {
                    HouseRow(title: house.name)
                        .onAppear() {
                            didShowRow(for: house)
                        }
                }
            }
            .navigationBarTitle("Houses", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func didShowRow(for shownHouse: House) {
        if shownHouse == dataStore.houses.tenthFromLast {
            dataStore.fetchNextPageOfHouses()
        }
    }
}

struct HousesList_Previews: PreviewProvider {
    
    @StateObject static var dataStore: IceAndFireDataStore = {
        let dataStore = IceAndFireDataStore()
        dataStore.loadPreviewContent()
        return dataStore
    }()
    
    static var previews: some View {
        HousesList(dataStore: dataStore)
    }
}
