//
//  ItineraryItem.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import Foundation

class ItineraryItem : ObservableObject, Identifiable {
    let id: UUID
    @Published var title: String
    @Published var date: Date
    @Published var location: Location
    @Published var notes: String
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
    
    init(id: UUID = UUID(), title: String, date: Date, notes: String, location: Location, theme: Theme) {
            self.id = id
            self.title = title
            self.date = date
            self.location = location
            self.theme = theme
            self.notes = notes
        }
}

extension ItineraryItem {
    static var empty: ItineraryItem {
        ItineraryItem(title: "", date: Date.now, notes: "", location: Location.empty, theme: .sky)
    }
}
