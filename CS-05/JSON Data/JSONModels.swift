//
// GitHub:  CS-05    Branch Version:  2023-03-17b
//
// by John Mather March 15, 2023
//

import Foundation

    struct SnapshotJSON: Codable, Identifiable {
        let id: String
        var name: String
        var dateCreated: String
        var insights: [Insight]
        
        struct Insight: Codable, Identifiable, Hashable {
            let id: String
            var insightName: String
            var insightCode: String
            var insightValue1: String
            var insightLowRange: String
            var insightHighRange: String
            
            var fullName: String {
                insightName + " " + insightCode
            }
        }
    }
    
