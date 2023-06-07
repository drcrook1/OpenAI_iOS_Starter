//
//  DailyScrum.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/2/23.
//

import Foundation

struct Excursion: Identifiable {
    let id: UUID
    var title: String
    var date: Date
    var dateAsString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: self.date)
        }
    }
    var itinerary: [ItineraryItem]
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, date: Date, itinerary: [ItineraryItem], theme: Theme) {
            self.id = id
            self.title = title
            self.date = date
            self.itinerary = itinerary
            self.theme = theme
        }
}

extension Excursion {
    static var empty: Excursion {
        Excursion(title: "", date: Date.now, itinerary: [], theme: .sky)
    }
}

extension Date {
    static func nowPlusComponents(minute: Int = 0, hour: Int = 0, days: Int = 0, months: Int = 0, years: Int = 0) -> Date {
        let currentDate = Date.now
        var dateComponent = DateComponents()
        dateComponent.minute = minute
        dateComponent.hour = hour
        dateComponent.day = days
        dateComponent.month = months
        dateComponent.year = years
        return Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date.now
    }
}

extension Excursion {
    static let sampleData: [Excursion] =
    [
        Excursion(title: "Custer Day 1",
                  date: Date.nowPlusComponents(days: 7),
                   itinerary: [
                    ItineraryItem(title: "Homeschool Activity", date: Date.nowPlusComponents(hour: 8, days: 7), location: Location(title: "Crazy Horse Memorial", address: "Crazy Horse, SD 57730"), theme: .bubblegum),
                    ItineraryItem(title: "Lunch", date: Date.nowPlusComponents(hour: 12, days: 7), location: Location(title: "Black Hills Bistro", address: "148 Main St, Hill City, SD 57745"), theme: .bubblegum),
                    ItineraryItem(title: "1800s Train Ride", date: Date.nowPlusComponents(hour: 14, days: 7), location: Location(title: "Keystone Depot", address: "103 Winter St, Keystone, SD 57751"), theme: .bubblegum)
                   ],
                   theme: .bubblegum),
        Excursion(title: "Boone, NC | Day 2",
                  date: Date.nowPlusComponents(days: 4),
                   itinerary: [],
                   theme: .bubblegum),
        Excursion(title: "Boone, NC | Day 1",
                  date: Date.nowPlusComponents(days: 2),
                   itinerary: [],
                   theme: .bubblegum),
    ]
}
