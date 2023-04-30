//
// GitHub:  CS-05    Branch Version:  2023-04-30A
//
// by John Mather April 30, 2023
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var insights: [Insight] = []
}
