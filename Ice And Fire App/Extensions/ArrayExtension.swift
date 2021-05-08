import Foundation

extension Array {
    
    var tenthFromLast: Element? {
        let offset = 10
        let lastIndex = self.endIndex - 1
        guard lastIndex >= offset else { return nil }
        return self[lastIndex - offset]
    }
}
