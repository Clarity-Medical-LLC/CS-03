//
// GitHub:  CS-05    Branch Version:  2023-03-17b
//
// by John Mather March 15, 2023
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
