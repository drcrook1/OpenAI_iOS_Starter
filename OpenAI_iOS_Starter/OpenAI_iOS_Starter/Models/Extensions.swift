//
//  Extensions.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import Foundation

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
    
    func timeAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: self)
    }
}
