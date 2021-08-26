//
//  WeekView.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import SwiftUI

struct WeekView: View {
    
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var selectedDateForWeek: Date?
    var colors = [Color("Color1"), Color("Color")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Daily Workout in Hours")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack(spacing: 15) {
                ForEach(mainViewModel.daysOfWeek, id: \.self) { day in
                    // Bars
                    VStack(alignment: .center) {
                            VStack {
                                Spacer(minLength: 0)
                                
                                if selectedDateForWeek == day {
                                    Text(getHrs(value: getTotalWorkoutMin(val: day)))
                                        .foregroundColor(Color("Color"))
                                        .padding(.bottom, 5)
                                }
                                
                                RoundedShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: selectedDateForWeek == day ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                    // max height = 200
                                    .frame(height: getHeight(value: getTotalWorkoutMin(val: day)))
                            }
                            .frame(height: 220)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedDateForWeek = day
                                }
                            }
                        
                        
                        Text(day.dailyText)
                            .font(.caption)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(10)
        .padding()
    }
    

    
    // converting Number to decimal
    func getTotalWorkoutMin(val: Date) -> CGFloat {
        var total: CGFloat = 0
        for day in mainViewModel.workoutData {
            if val.day == day.date.day  && val.month == day.date.month  && val.year == day.date.year  {
                total = total + day.workoutInMin
            }
        }
        return total
    }
    
    // Calculating Hrs For Height
    func getHeight(value: CGFloat) -> CGFloat {
        // the value in minutes
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    // getting hours
    func getHrs(value: CGFloat) -> String {
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
