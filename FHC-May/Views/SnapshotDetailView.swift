//
// GitHub:  CS-05    Branch Version:  2023-05-05A
//
// by John Mather 
//

import SwiftUI

struct SnapshotDetailView: View {
    @EnvironmentObject var snapshotDataStore: SnapshotDataStore
    var insightId: Insight.ID?
    var body: some View {
        if let insightId {
            if let insight = snapshotDataStore.insight(id: insightId) {
                VStack {
                 Text ("xxx")
                        .navigationTitle(insight.insightName)

//                    .toolbarBackground(.orange.gradient, for: .navigationBar)
//                    .toolbarBackground(.visible, for: .navigationBar)
//                    .toolbarColorScheme(.dark, for: .navigationBar)
                    
          
                    Text("Condition:   " + insight.insightName)
                        .font(.headline)
                    Text("\"" + insight.insightCode + "\"")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .italic()
                        .padding()
                    Grid {
                        GridRow(alignment: .top) {
                            Text("Low:").bold()
                                .gridColumnAlignment(.trailing)
                            Text(insight.insightLowRange)
                                .gridColumnAlignment(.leading)
                        }
                        GridRow(alignment: .top) {
                            Text("Target:").bold()
                            Text(insight.insightValue1)
                        }
                        GridRow(alignment: .top) {
                            Text("High:").bold()
                            Text(insight.insightHighRange)
                        }
                    }
                    .padding()
                    .border(.primary)
                    .font(.title3)
  //                  Spacer()
                }
                .padding(.horizontal, 20)
            }
            Text("Specialist Assigned")
            Text("Tracking Biometrics:")
            Text("Care Pathways:  Options, Risks & Incentives")
            Text("Progress")
            Text("Questions to Ask")
            Text("Articles & Videos")
            Text("Med Kit")
            Text("Calendar")

            Spacer()
            
        } else {
            VStack {
                Image("insight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text("Condition Details")
                    .font(.headline)
                
            }
        }
        
    }
}
    

struct SnapshotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotDetailView(insightId: "92c08f4a-d5bf-49e4-809f-7aefaa155c16")
            .environmentObject(SnapshotDataStore())
    }
}
