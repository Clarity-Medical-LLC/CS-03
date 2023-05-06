//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var conditions: [Condition] = []
}
