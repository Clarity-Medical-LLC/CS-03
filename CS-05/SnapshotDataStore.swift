//
// GitHub:  CS-05    Branch Version:  2023-05-05A
//
// by John Mather 
//
    

import Foundation

class SnapshotDataStore: ObservableObject {
 
    // MARK: - Each IdCard may be linked one or more Snapshots.  A Snapshot is a point-in-time set of health data insights:

    @Published var Snapshots: [Snapshot] = []
    
    // MARK: - Each Snapshot has multiple groups of health data cards, each group of cards is called an Insight:
    
    @Published var Insights: [Insight] = []
    @Published var insightsFilter = ""
    
//    var filteredInsights: [Insight] {
//        insightsFilter.isEmpty ? Insights : Insights.filter {$0.fullName.lowercased().contains(insightsFilter.lowercased())}
//    }

    init() {
        loadSnapshots()
    }
    
    func loadSnapshots() {
        let json = Bundle.main.decode([SnapshotJSON].self, from: "SNAPSHOT_MOCK_DATA.json")
        for snapshot in json {
            var newSnapshot = Snapshot(id: snapshot.id, dateCreated: snapshot.dateCreated, name: snapshot.description)
            for insight in snapshot.insights {
                let newInsight = Insight(id: insight.id,
                                           insightName: insight.insightName,
                                           insightCode: insight.insightCode,
                                           insightLowRange: insight.insightLowRange,
                                           insightHighRange: insight.insightHighRange,
                                           insightValue1: insight.insightValue1,
                                           familymember: newSnapshot)
                Insights.append(newInsight)
                newSnapshot.insights.append(newInsight)
            }
            newSnapshot.insights = newSnapshot.insights.sorted(using: KeyPathComparator(\.insightCode))
            Snapshots.append(newSnapshot)
            
        }
        Snapshots = Snapshots.sorted(using: KeyPathComparator(\.dateCreated))
        Insights = Insights.sorted(using: KeyPathComparator(\.insightCode))
    }
    
    func insight(id: String) -> Insight? {
        Insights.first(where: {$0.id == id})
    }
    
    func familymember(id: String) -> Snapshot? {
        Snapshots.first(where: {$0.id == id})
    }
}
