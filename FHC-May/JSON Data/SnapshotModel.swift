//
// GitHub:  FHC-May    Branch Version:   2023-05-xxx
//
// by John Mather May, 2023
//

import Foundation

    struct SnapshotJSON: Codable, Identifiable {
        let id: String
        var description: String
        var dateCreated: String
        var conditions: [Condition]
        
        struct Condition: Codable, Identifiable, Hashable {
            let id: String
            var conditionName: String
            var conditionCode: String
            var conditionValue1: String
            var conditionLowRange: String
            var conditionHighRange: String
            
            var fullName: String {
                conditionName + " " + conditionCode
            }
        }
    }
    
