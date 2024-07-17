//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/17/24.
//

import SwiftData
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    @Environment(\.modelContext) var modelContext
    @Query private var prospects: [Prospect]
        
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.email)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        let prospect = Prospect(name: "Om Preetham", email: "ompreethambandi@gmail.com", isContacted: false)
                        modelContext.insert(prospect)
                    }) {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
            }
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter == .none {
            _prospects = Query(sort: \Prospect.name)
        } else {
            let showContactedOnly = filter == .contacted
            _prospects = Query(filter: #Predicate { $0.isContacted == showContactedOnly }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
