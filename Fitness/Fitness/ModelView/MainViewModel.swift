//
//  MainViewModel.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import Foundation

class MainViewModel: ObservableObject{
    
    @Published var workoutData = [Daily]()
    @Published var daysOfWeek = [Date]()
    @Published var monthsOfYear = [Date]()
    @Published var years = [Date]()

    init() {
        var weekDate = Date.today
        daysOfWeek.append(weekDate)
        for _ in 1...6 {
            weekDate = weekDate.dayBefore
            daysOfWeek.append(weekDate)
        }
        
        var monthDate = Date.today
        monthsOfYear.append(monthDate)
        for _ in 1...29 {
            monthDate = monthDate.dayBefore
            monthsOfYear.append(monthDate)
        }
        
        var yearDate = Date.today
        years.append(yearDate)
        for _ in 2...Date.today.month {
            yearDate = yearDate.monthBefore
            years.append(yearDate)
        }
        
        fetchWorkoutData()
        
    }
    
    func fetchWorkoutData(){
        workoutData = [
            Daily(id: 1, day: 1, month:4, year: 2019, workoutInMin: 2480),
            Daily(id: 2, day: 1, month:4, year: 2021, workoutInMin: 480),
            Daily(id: 3, day: 2, month:6, year: 2021, workoutInMin: 880),
            Daily(id: 4, day: 3, month:7, year: 2021, workoutInMin: 250),
            Daily(id: 5, day: 18, month:7, year: 2021, workoutInMin: 360),
            Daily(id: 6, day: 19, month:7, year: 2021, workoutInMin: 1220),
            Daily(id: 7, day: 22, month:7, year: 2021, workoutInMin: 750),
            Daily(id: 8, day: 23, month:7, year: 2021, workoutInMin: 950),
            Daily(id: 9, day: 1, month:8, year: 2021, workoutInMin: 480),
            Daily(id: 10, day: 2, month:8, year: 2021, workoutInMin: 880),
            Daily(id: 11, day: 3, month:8, year: 2021, workoutInMin: 250),
            Daily(id: 12, day: 19, month:8, year: 2021, workoutInMin: 360),
            Daily(id: 13, day: 20, month:8, year: 2021, workoutInMin: 1220),
            Daily(id: 14, day: 23, month:8, year: 2021, workoutInMin: 750),
            Daily(id: 15, day: 24, month:8, year: 2021, workoutInMin: 950)
        ]
    }

    
}
