//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//

import SwiftUI

struct ConditionDetailView: View {
    @EnvironmentObject var snapshotDataStore: SnapshotDataStore
    var conditionId: Condition.ID?
    var body: some View {
        if let conditionId {
            if let condition = snapshotDataStore.condition(id: conditionId) {
                VStack {
                 Text ("xxx")
                        .navigationTitle(condition.conditionName)

//                    .toolbarBackground(.orange.gradient, for: .navigationBar)
//                    .toolbarBackground(.visible, for: .navigationBar)
//                    .toolbarColorScheme(.dark, for: .navigationBar)
                    
          
                    Text("Condition:   " + condition.conditionName)
                        .font(.headline)
                    Text("\"" + condition.conditionCode + "\"")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .italic()
                        .padding()
                    Grid {
                        GridRow(alignment: .top) {
                            Text("Low:").bold()
                                .gridColumnAlignment(.trailing)
                            Text(condition.conditionLowRange)
                                .gridColumnAlignment(.leading)
                        }
                        GridRow(alignment: .top) {
                            Text("Target:").bold()
                            Text(condition.conditionValue1)
                        }
                        GridRow(alignment: .top) {
                            Text("High:").bold()
                            Text(condition.conditionHighRange)
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
                Image("condition")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text("Condition Details")
                    .font(.headline)
                
            }
        }
        
    }
}
    

struct ConditionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionDetailView(conditionId: "92c08f4a-d5bf-49e4-809f-7aefaa155c16")
            .environmentObject(SnapshotDataStore())
    }
}
