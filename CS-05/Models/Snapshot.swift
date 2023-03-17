//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-07-22
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
    

import Foundation

struct Snapshot: Identifiable {
    var id: String
    var dateCreated: String
    var name: String
    var insights: [Insight] = []
}
