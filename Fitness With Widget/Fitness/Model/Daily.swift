//
//  Daily.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import Foundation
import SwiftUI

struct Daily: Identifiable, Hashable {
    var id: Int
    var day: Int
    var month: Int
    var year: Int
    var workoutInMin: CGFloat
    var text: String { return "\(day)/\(month)" }
    var dateFormatted: String {
        let formatter1 = DateFormatter()
        //        formatter1.dateStyle = .short
        formatter1.dateFormat = "d MMM y"
        
        return formatter1.string(from: Date.from(year: year, month: month, day: day))
        
    }
    var dailyText: String {
        let formatter1 = DateFormatter()
        //        formatter1.dateStyle = .short
        formatter1.dateFormat = "d\nMMM\ny"
        
        return formatter1.string(from: Date.from(year: year, month: month, day: day))
        
    }
    var date: Date{
        return Date.from(year: year, month: month, day: day)
    }
}


