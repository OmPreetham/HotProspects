//
//  Prospects.swift
//  HotProspects
//
//  Created by Om Preetham Bandi on 7/17/24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var email: String
    var isContacted: Bool
    var updatedDate: Date
    
    init(name: String, email: String, isContacted: Bool, updatedDate: Date) {
        self.name = name
        self.email = email
        self.isContacted = isContacted
        self.updatedDate = updatedDate
    }
}
