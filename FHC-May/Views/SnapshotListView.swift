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
                Text("Clinicial Snapshot - Current Situation")
                    .font(.headline)
                
            }
            .padding()
        } else {
            if let snapshot = snapshotDataStore.snapshot(id: snapshotID!) {
                
                
                // This is the Family Member Title Block for top of Insignts List View
                
                VStack (alignment: .leading) {
                    Text(snapshot.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding ([.leading])
                    HStack {
                        Text("Snapshot, as of: "
                             + "\(snapshot.dateCreated)")
                        .font(.subheadline)
                        .padding ([.leading])
                    }

                    Text ("- Profile, Vitals & Risk Scores")
                        .padding ([.leading, .top])
                    
                    Text ("My Medical Questions:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding ([.leading, .top, .bottom])
   
                    Text ("1. I'm feeling lathargic, and the last time I felt this way it was my blood thinner Should I change my meds?")
                        .padding ([.leading])


                    Text ("My Insurance Questions:")
                         .font(.title)
                         .fontWeight(.bold)
                         .foregroundColor(.red)
                         .padding ([.leading, .top, .bottom])
                    
                    Text ("1. What is the status of the Prior Authorization pending for my hip surgury?")
                        .padding ([.leading])
                    
                   Text ("My Health:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding ([.leading, .top])
                    
                }


                
                List(snapshot.insights, selection: $insightId) { insight in

                        VStack (alignment: .leading) {
                           
                                Text(insight.insightName)
                                    .font(.headline)

                        }
                 
                }
                .padding(.leading)

                
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
