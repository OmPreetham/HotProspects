//
//  EditView.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/19/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email Address", text: $prospect.email)
            
        }
        .toolbar {
            Button("Save") {
                dismiss()
            }
        }
    }
}

#Preview {
    EditView(prospect: Prospect(name: "Paul Hudson", email: "paul@hackingwithswift.com", isContacted: false, updatedDate: Date.now))
}
