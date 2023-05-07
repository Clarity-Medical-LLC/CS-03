//
// GitHub:  FHC-May    Branch Version:  2023-05-xxx
//
// by John Mather 
//
    

import Foundation

class SnapshotViewModel: ObservableObject {
 
    @Published var Snapshots: [Snapshot] = []
    @Published var Conditions: [Condition] = []
    @Published var conditionsFilter = ""
    
//    var filteredConditions: [Condition] {
//        conditionsFilter.isEmpty ? Conditions : Conditions.filter {$0.fullName.lowercased().contains(conditionsFilter.lowercased())}
//    }

    init() {
        loadSnapshots()
    }
    
    func loadSnapshots() {
        let json = Bundle.main.decode([SnapshotJSON].self, from: "SNAPSHOT_MOCK_DATA.json")
        for snapshot in json {
            var newSnapshot = Snapshot(id: snapshot.id, dateCreated: snapshot.dateCreated, name: snapshot.description)
            for condition in snapshot.conditions {
                let newCondition = Condition(id: condition.id,
                                           conditionName: condition.conditionName,
                                           conditionCode: condition.conditionCode,
                                           conditionLowRange: condition.conditionLowRange,
                                           conditionHighRange: condition.conditionHighRange,
                                           conditionValue1: condition.conditionValue1,
                                           snapshot: newSnapshot)
                Conditions.append(newCondition)
                newSnapshot.conditions.append(newCondition)
            }
            newSnapshot.conditions = newSnapshot.conditions.sorted(using: KeyPathComparator(\.conditionCode))
            Snapshots.append(newSnapshot)
            
        }
 //       Snapshots = Snapshots.sorted(using: KeyPathComparator(\.dateCreated))
//        Conditions = Conditions.sorted(using: KeyPathComparator(\.conditionCode))
    }
    // Return first condition where condition matches, if one exists (?)
    func condition(id: String) -> Condition? {
        Conditions.first(where: {$0.id == id})
    }
    
    func snapshot(id: String) -> Snapshot? {
        Snapshots.first(where: {$0.id == id})
    }
}
