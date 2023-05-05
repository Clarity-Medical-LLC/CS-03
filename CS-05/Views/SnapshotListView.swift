//
// GitHub:  CS-05    Branch Version:  2023-05-05A
//
// by John Mather 
//

import SwiftUI

struct SnapshotListView: View {
    @EnvironmentObject var snapshotDataStore: SnapshotDataStore
    @State private var snapshotID: Snapshot.ID?
    @State private var insightId: Insight.ID?
    @State private var columnVisibility:  NavigationSplitViewVisibility = .all
    
    var body: some View {
        
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "-"
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "--"
        
        // MARK: - NAVIGATION SPLIT VIEW... START
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            
            // To display the App Name & Version underneath .navigationTitle
            
            HStack {
                Text("  Github: "
                     + (appName)
                     + "   v. "
                     + (appVersion))
                    .font(.subheadline)
                    .padding(.leading)
                Spacer()
            }

            
            // NSV Part 1 - list family members
            
            List(snapshotDataStore.Snapshots, selection: $snapshotID) { snapshot in
                
                HStack (alignment: .top) {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                    
                    VStack (alignment: .leading) {
                        Text(snapshot.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(snapshot.dateCreated)
                            .font(.caption)
                            .padding(.bottom)
                    }
                    Spacer()
                    Image(systemName: "checkmark.seal.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
            }
            .navigationTitle("My Family")
            
        }
        
        // MARK: - CONTENT SECTION OF NAVIGATION SPLIT VIEW
        
    content: {
        if snapshotID == nil {
            VStack {
                Image("snapshotPlaceholder")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                Text("Clinicial Snapshot - Insight Groups")
                    .font(.headline)
                
            }
            .padding()
        } else {
            if let snapshot = snapshotDataStore.snapshot(id: snapshotID!) {
                
                
                // This is the Family Member Title Block for top of Insignts List View
                
                VStack (alignment: .leading) {
                    Text(snapshot.name)
                        .font(.title)
                        .padding (.leading)
                    HStack {
                        Text("Conditions as of: "
                             + "\(snapshot.dateCreated)")
                        .font(.subheadline)
                        .padding (.leading)
                        Spacer()
                    }
                }
               Spacer()

                
                List(snapshot.insights, selection: $insightId) { insight in

                        VStack (alignment: .leading) {
                            Text(insight.insightName)
                                .font(.headline)
                            Text("Condition")
                                .font(.caption)
  
                        }
                }
                .padding()
              .navigationTitle(snapshot.name)
                
            }
            
        }
    }
        
        
        // MARK: - DETAIL SECTION OF NAVIGATION SPLIT VIEW
            detail: {
                SnapshotDetailView(insightId: insightId)
            }

        .navigationSplitViewStyle(.balanced)
 
        .onChange(of: snapshotID) { _ in insightId = nil; columnVisibility = .doubleColumn}
 
        .onChange(of: insightId) { _ in
        if insightId == nil {
            columnVisibility = .all
        } else {
            columnVisibility = .doubleColumn
        }


    }
        
    }
    

}



struct SnapshotListView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotListView()
            .environmentObject(SnapshotDataStore())
    }
}
