//
//  Prospects.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/17/24.
//

import SwiftData

@Model
class Prospect {
    var name: String
    var email: String
    var isContacted: Bool
    
    init(name: String, email: String, isContacted: Bool) {
        self.name = name
        self.email = email
        self.isContacted = isContacted
    }
}
