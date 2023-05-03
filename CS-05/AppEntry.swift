//
// GitHub:  CS-05    Branch Version:  2023-05-03A
//
// by John Mather May 03, 2023
//
    

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var store = DataStore()
    var body: some Scene {
        WindowGroup {

            SnapshotListView()
            
                .environmentObject(store)
        }
    }
}
