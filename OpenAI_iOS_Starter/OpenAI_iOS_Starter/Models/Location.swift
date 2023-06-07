//
//  Location.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import Foundation

struct Location: Identifiable {
    let id: UUID
    var title: String
    var address: String
    
    init(id: UUID = UUID(), title: String, address: String) {
            self.id = id
            self.title = title
            self.address = address
        }
}
