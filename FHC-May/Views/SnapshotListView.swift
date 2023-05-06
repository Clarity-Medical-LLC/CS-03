//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//

import SwiftUI

struct SnapshotListView: View {
    @EnvironmentObject var snapshotDataStore: SnapshotDataStore
    @State private var snapshotID: Snapshot.ID?
    @State private var conditionId: Condition.ID?
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
                Text("Clinicial Snapshot")
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

                    
                    
                    Text ("Profile")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding ([.leading, .top, .bottom])
   
                    Text ("Description, Vitals, Recent Symptoms")
                        .padding ([.leading])


                    Text ("My Questions:")
                         .font(.title)
                         .fontWeight(.bold)
                         .foregroundColor(.red)
                         .padding ([.leading, .top, .bottom])
                    
                    Text ("1. What is the status of the Prior Authorization pending for my hip surgury?")
                        .padding ([.leading])
                    
                    Text ("2. I'm feeling lathargic, and the last time I felt this way it was my blood thinner Should I change my meds?")
                        .padding ([.leading, .top])
                    
                   Text ("I'm Watching:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding ([.leading, .top])
                    
                }


                
                List(snapshot.conditions, selection: $conditionId) { condition in

                        VStack (alignment: .leading) {
                           
                                Text(condition.conditionName)
                                    .font(.headline)

                        }
                 
                }
                .padding(.leading)

                
            }
        
        }
    
    }
        
        
        // MARK: - DETAIL SECTION OF NAVIGATION SPLIT VIEW
            detail: {
                ConditionDetailView(conditionId: conditionId)
            }

        .navigationSplitViewStyle(.balanced)
 
        .onChange(of: snapshotID) { _ in conditionId = nil; columnVisibility = .doubleColumn}
 
        .onChange(of: conditionId) { _ in
        if conditionId == nil {
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
