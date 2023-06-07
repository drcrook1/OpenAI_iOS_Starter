//
//  ItineraryItem.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import Foundation

struct ItineraryItem : Identifiable {
    let id: UUID
    var title: String
    var date: Date
    var location: Location
    var theme: Theme
    var dateAsString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: self.date)
        }
    }
    var timeAsString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: self.date)
        }
    }
    
    init(id: UUID = UUID(), title: String, date: Date, location: Location, theme: Theme) {
            self.id = id
            self.title = title
            self.date = date
            self.location = location
            self.theme = theme
        }
}