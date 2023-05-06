//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//

import Foundation

struct Condition: Identifiable {
    var id: String
    var conditionName: String
    var conditionCode: String
    var conditionLowRange: String
    var conditionHighRange: String
    var conditionValue1: String
    var snapshot: Snapshot
    
    var fullName: String {
        conditionName + " " + conditionCode
    }
}
