//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//
    

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var snapshotdatastore = SnapshotViewModel()
    var body: some Scene {
        WindowGroup {

            SnapshotListView()
            
                .environmentObject(snapshotdatastore)
        }
    }
}

struct Previews_AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
