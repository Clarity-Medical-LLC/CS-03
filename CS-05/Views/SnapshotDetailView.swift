//
// GitHub:  CS-05    Branch Version:  2023-04-30A
//
// by John Mather April 30, 2023
//

import SwiftUI

struct SnapshotDetailView: View {
    @EnvironmentObject var store: DataStore
    var insightId: Insight.ID?
    var body: some View {
        if let insightId {
            if let insight = store.insight(id: insightId) {
                VStack {
                 Text ("")
                        .navigationTitle(insight.insightName)

//                    .toolbarBackground(.orange.gradient, for: .navigationBar)
//                    .toolbarBackground(.visible, for: .navigationBar)
//                    .toolbarColorScheme(.dark, for: .navigationBar)
                    
                    Spacer()
                    Text("Ingiht Tile Details:   " + insight.insightName)
                        .font(.headline)
                    Text("\"" + insight.insightHighRange + "\"")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .italic()
                        .padding()
                    Grid {
                        GridRow(alignment: .top) {
                            Text("Department:").bold()
                                .gridColumnAlignment(.trailing)
                            Text(insight.insightLowRange)
                                .gridColumnAlignment(.leading)
                        }
                        GridRow(alignment: .top) {
                            Text("Title:").bold()
                            Text(insight.insightValue1)
                        }
                    }
                    .padding()
                    .border(.primary)
                    .font(.title3)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        } else {
            VStack {
                Image("insight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text("Insight - Details")
                    .font(.headline)
                
            }
        }
        
    }
}
    

struct SnapshotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotDetailView(insightId: "92c08f4a-d5bf-49e4-809f-7aefaa155c16")
            .environmentObject(DataStore())
    }
}
