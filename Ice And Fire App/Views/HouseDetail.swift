import SwiftUI

struct HouseDetail: View {
    
    var viewModel: HouseDetailViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.infoSections, id: \.title) { infoSection in
                self.infoSection(for: infoSection.info, with: infoSection.title)
            }
            .navigationBarTitle(viewModel.name, displayMode: .inline)
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accessibility(label: Text("House Details"))
    }
    
    @ViewBuilder
    private func infoSection(for info: String, with title: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
            .font(.subheadline)
            .foregroundColor(.secondary)
            Text(info)
        }
    }
}

struct HouseDetail_Previews: PreviewProvider {
    
    static var dataStore: IceAndFireDataStore = {
        let dataStore = IceAndFireDataStore()
        dataStore.loadPreviewContent()
        return dataStore
    }()
    
    static var previews: some View {
        HouseDetail(viewModel: HouseDetailViewModel(house: dataStore.houses[0]))
    }
}
