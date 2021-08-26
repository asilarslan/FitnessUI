//
//  YearView.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import SwiftUI

struct YearView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var selectedDateForYear: Date?
    var colors = [Color("Color1"), Color("Color")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Monthly Workout in Hours")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack(spacing: 15) {
                ForEach(mainViewModel.years, id: \.self) { year in
                    // Bars
                    VStack(alignment: .center) {
                        VStack {
                            Spacer(minLength: 0)
                            
                            if selectedDateForYear == year {
                                Text(getHrs(value: getTotalWorkoutMin(val:year)))
                                    .font(.footnote)
                                    .foregroundColor(Color("Color"))
                                    .padding(.bottom, 5)
                                    
                            }
                            
                            RoundedShape()
                                .fill(LinearGradient(gradient: Gradient(colors: selectedDateForYear == year ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                // max height = 200
                                .frame(height: getHeight(value: getTotalWorkoutMin(val:year) / 15))
                        }
                        .frame(height: 220)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                selectedDateForYear = year
                            }
                        }
                        
                        Text(year.yearlyText)
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
            if val.year == day.year {
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

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearView()
    }
}
