//
// GitHub:  CS-05    Branch Version:  2023-04-30A
//
// by John Mather April 30, 2023
//
    

import Foundation

class DataStore: ObservableObject {
    
//  @Published var Families: [Family] = []
//  @Published var FamilyMembers: [FamilyMember} = []
    @Published var Snapshots: [Snapshot] = []
    @Published var Insights: [Insight] = []
    @Published var insightsFilter = ""
    
    var filteredEmployees: [Insight] {
        insightsFilter.isEmpty ? Insights : Insights.filter {$0.fullName.lowercased().contains(insightsFilter.lowercased())}
    }

    init() {
        loadData()
    }
    
    func loadData() {
        let json = Bundle.main.decode([FamilyMemberJSON].self, from: "MOCK_DATA.json")
        for familymember in json {
            var newFamilyMember = Snapshot(id: familymember.id, dateCreated: familymember.dateCreated, name: familymember.name)
            for insight in familymember.insights {
                let newInsight = Insight(id: insight.id,
                                           insightName: insight.insightName,
                                           insightCode: insight.insightCode,
                                           insightLowRange: insight.insightLowRange,
                                           insightHighRange: insight.insightHighRange,
                                           insightValue1: insight.insightValue1,
                                           familymember: newFamilyMember)
                Insights.append(newInsight)
                newFamilyMember.insights.append(newInsight)
            }
            newFamilyMember.insights = newFamilyMember.insights.sorted(using: KeyPathComparator(\.insightCode))
            Snapshots.append(newFamilyMember)
            
        }
        Snapshots = Snapshots.sorted(using: KeyPathComparator(\.name))
        Insights = Insights.sorted(using: KeyPathComparator(\.insightCode))
    }
    
    func insight(id: String) -> Insight? {
        Insights.first(where: {$0.id == id})
    }
    
    func familymember(id: String) -> Snapshot? {
        Snapshots.first(where: {$0.id == id})
    }
}
