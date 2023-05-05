//
// GitHub:  CS-05    Branch Version:  2023-05-05A
//
// by John Mather 
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var insights: [Insight] = []
}
