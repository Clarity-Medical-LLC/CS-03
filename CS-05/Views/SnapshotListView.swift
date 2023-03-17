//
// Created for NavigationSplitView
// by Stewart Lynch on 2022-07-22
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct SnapshotListView: View {
    @EnvironmentObject var store: DataStore
    @State private var familyMemberId: Snapshot.ID?
    @State private var insightId: Insight.ID?
    @State private var columnVisibility:
    
    NavigationSplitViewVisibility = .all
    
    var body: some View {
        
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "-"
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "--"
        
        // MARK: - NAVIGATION SPLIT VIEW... START
        
        NavigationSplitView(columnVisibility: $columnVisibility) {
            
            // To display the App Name & Version underneath .navigationTitle
            
            HStack {
                Text("\(appName)  \(appVersion)")
                    .font(.caption2)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                    .italic()
            }
            
            // NSV Part 1 - list family members
            
            List(store.FamilyMembers, selection: $familyMemberId) { familymember in
                
                HStack (alignment: .top) {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                    
                    VStack (alignment: .leading) {
                        Text(familymember.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("Reason for visit")
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
        if familyMemberId == nil {
            VStack {
                Image("familymember")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                Text("Clinicians Snapshots")
                    .font(.headline)
                
            }
            .padding()
        } else {
            if let familymember = store.familymember(id: familyMemberId!) {
                
                
                // This is the Patient Title Block for top of Insignts List View
                List(familymember.insights, selection: $insightId) { insight in
                    GroupBox  {
                        VStack (alignment: .leading) {
                            Text(insight.insightName)
                                .font(.headline)
                            Text("Insight                                                                                               ")
                                .font(.caption)
                        }
                    }
                }
                .padding()
                .navigationTitle(familymember.name)
                
                
            }
        }
    }
        
        
        // MARK: - DETAIL SECTION OF NAVIGATION SPLIT VIEW
            detail: {
                SnapshotDetailView(insightId: insightId)
            }
    


        .navigationSplitViewStyle(.balanced)
 
    .onChange(of: familyMemberId) { _ in insightId = nil; columnVisibility = .doubleColumn}
 
    .onChange(of: insightId) { _ in
        if insightId == nil {
            columnVisibility = .all
        } else {
            columnVisibility = .detailOnly
        }


    }
        
    }
    

}



struct FamilyMembesListView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotListView()
            .environmentObject(DataStore())
    }
}
