//
//  Extensions.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import SwiftUI
import Foundation

extension Date {
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
    
    static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.date(from: string)!
        return date
    }
    
    static var yesterday:  Date { return Date().dayBefore }
    static var today: Date {return Date()}
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var monthBefore: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
    
    var yearBefore: Date {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)!
    }
    
    var dailyText: String {
        let formatter1 = DateFormatter()
        //        formatter1.dateStyle = .short
        formatter1.dateFormat = "d\nMMM\ny"
        
        return formatter1.string(from: self)
        
    }
    
    var monthlyText: String {
        let formatter1 = DateFormatter()
        //        formatter1.dateStyle = .short
        formatter1.dateFormat = "MMM\ny"
        
        return formatter1.string(from: self)
        
    }
    
    var yearlyText: String {
        let formatter1 = DateFormatter()
        //        formatter1.dateStyle = .short
        formatter1.dateFormat = "y"
        
        return formatter1.string(from: self)
        
    }
    
    
    var day: Int {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "d"
        return Int(formatter1.string(from: self))!
    }
    
    var month: Int {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "M"
        return Int(formatter1.string(from: self))!
    }
    
    var year: Int {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "y"
        return Int(formatter1.string(from: self))!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var startOfMonth: Date {
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)
        
        return  calendar.date(from: components)!
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
    }
    
    func isMonday() -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: self)
        return components.weekday == 2
    }
    
}

extension View {
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
