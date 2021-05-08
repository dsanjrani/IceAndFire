import Foundation
@testable import Ice_And_Fire_App

struct MockDispatchQueue: DispatchQueueProtocol {
    
    let asyncCompletion: ()->()
    
    func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWorkItemFlags, execute work: @escaping @convention(block) () -> Void) {
        DispatchQueue.main.async(group: group, qos: qos, flags: flags) {
            work()
            self.asyncCompletion()
        }
    }
}
