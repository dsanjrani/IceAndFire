import SwiftUI

struct HouseRow: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
    }
}

struct HouseRow_Previews: PreviewProvider {
    
    static var previews: some View {
        HouseRow(title: "Short Title")
            .previewLayout(.fixed(width: 300, height: 70))
        HouseRow(title: "Long Title For Testing Line Breaks Line Breaks Line Breaks")
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
