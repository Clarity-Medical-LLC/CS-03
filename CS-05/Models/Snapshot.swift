//
// GitHub:  CS-05    Branch Version:  2023-03-17b
//
// by John Mather March 15, 2023
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var insights: [Insight] = []
}
