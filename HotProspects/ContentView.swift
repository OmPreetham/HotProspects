//
//  ContentView.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        
        Text(output)
            .task {
                await fetchResults()
            }
    }
    
    func fetchResults() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "\(error.localizedDescription)"
            
        }
    }
}

#Preview {
    ContentView()
}
