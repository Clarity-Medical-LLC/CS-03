//
// GitHub:  CS-05    Branch Version:  2023-03-17b
//
// by John Mather March 15, 2023
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
