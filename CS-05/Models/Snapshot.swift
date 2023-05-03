//
// GitHub:  CS-05    Branch Version:  2023-05-03A
//
// by John Mather May 03, 2023
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var insights: [Insight] = []
}
