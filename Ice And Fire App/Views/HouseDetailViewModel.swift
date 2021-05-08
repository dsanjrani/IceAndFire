import Foundation

struct HouseDetailViewModel {
    
    let name: String
    let infoSections: [(title: String, info: String)]
    
    init(house: House) {
        var sections = [(title: String, info: String)]()
        sections.storeInfoSection(for: house.titles, with: "Titles")
        sections.storeInfoSection(for: house.region, with: "Region")
        sections.storeInfoSection(for: house.words, with: "Words")
        sections.storeInfoSection(for: house.coatOfArms, with: "Coat of Arms")
        sections.storeInfoSection(for: house.seats, with: "Seats")
        sections.storeInfoSection(for: house.ancestralWeapons, with: "Ancestral Weapons")
        sections.storeInfoSection(for: house.founded, with: "Founded")
        sections.storeInfoSection(for: house.diedOut, with: "Died Out")
        self.name = house.name
        self.infoSections = sections
    }
}

fileprivate extension Array where Element == (title: String, info: String) {
    
    mutating func storeInfoSection(for info: String?, with title: String) {
        guard let unwrappedInfo = info, unwrappedInfo.count > 0 else { return }
        let infoSection = (title: title, info: unwrappedInfo)
        self.append(infoSection)
    }
    
    mutating func storeInfoSection(for infos: [String], with title: String) {
        var composedInfo = ""
        for info in infos where info.count > 0 {
            composedInfo.append("• \(info)\n")
        }
        composedInfo.removeNewLineSuffix()
        storeInfoSection(for: composedInfo, with: title)
    }
}

fileprivate extension String {
    
    mutating func removeNewLineSuffix() {
        guard hasSuffix("\n") else { return }
        removeLast(1)
    }
}
