//
// GitHub:  CS-05    Branch Version:  2023-03-17b
//
// by John Mather March 15, 2023
//
    

import Foundation

class DataStore: ObservableObject {
    @Published var FamilyMembers: [Snapshot] = []
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
            FamilyMembers.append(newFamilyMember)
            
        }
        FamilyMembers = FamilyMembers.sorted(using: KeyPathComparator(\.name))
        Insights = Insights.sorted(using: KeyPathComparator(\.insightCode))
    }
    
    func insight(id: String) -> Insight? {
        Insights.first(where: {$0.id == id})
    }
    
    func familymember(id: String) -> Snapshot? {
        FamilyMembers.first(where: {$0.id == id})
    }
}
