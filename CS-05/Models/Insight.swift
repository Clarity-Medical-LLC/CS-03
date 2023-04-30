//
// GitHub:  CS-05    Branch Version:  2023-04-30A
//
// by John Mather April 30, 2023
//

import Foundation

struct Insight: Identifiable {
    var id: String
    var insightName: String
    var insightCode: String
    var insightLowRange: String
    var insightHighRange: String
    var insightValue1: String
    var familymember: Snapshot
    
    var fullName: String {
        insightName + " " + insightCode
    }
}
