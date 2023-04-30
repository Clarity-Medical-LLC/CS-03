//
// GitHub:  CS-05    Branch Version:  2023-04-30A
//
// by John Mather April 30, 2023
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
