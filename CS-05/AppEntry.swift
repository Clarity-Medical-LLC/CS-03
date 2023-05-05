//
// GitHub:  CS-05    Branch Version:  2023-05-05A
//
// by John Mather 
//
    

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var store = SnapshotDataStore()
    var body: some Scene {
        WindowGroup {

            SnapshotListView()
            
                .environmentObject(store)
        }
    }
}

struct Previews_AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
