//
//  FitnessWidget.swift
//  FitnessWidget
//
//  Created by Asil Arslan on 23.08.2021.
//

import WidgetKit
import SwiftUI
import Intents

// First, creating Model for Widget data
struct Model: TimelineEntry {
    var date: Date
    var widgetData: [Daily]
}


struct Provider: TimelineProvider {
    @ObservedObject var mainViewModel = MainViewModel()
    func placeholder(in context: Context) -> Model {
        Model(date: Date(), widgetData: Array(repeating: Daily(id: 15, day: 23, month:8, year: 2021, workoutInMin: 950), count: 6))
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(in context: Context, completion: @escaping (Model) -> ()) {
        // initial snapshot
        // or loading type content
        let loadingData = Model(date: Date(), widgetData: Array(repeating: Daily(id: 15, day: 23, month:8, year: 2021, workoutInMin: 950), count: 7))
        
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> ()) {
        // parsing JSON data and displaying
//        getData { modelData in
//            let date = Date()
//            let data = Model(date: date, widgetData: modelData)
//
//            // creating Timeline
//
//            // reloading data every 15 minutes
//            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: date)
//            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
//
//            completion(timeline)
//        }
        
        let date = Date()
        let data = Model(date: date, widgetData: mainViewModel.workoutData)
        
        // creating Timeline
        
        // reloading data every 15 minutes
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: date)
        let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
        
        completion(timeline)
    }
}

//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationIntent
//}

struct FitnessWidgetEntryView : View {
    var entry: Provider.Entry
    @EnvironmentObject var mainViewModel: MainViewModel

    var body: some View {
//        Text(entry.date, style: .time)
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
                                
                                    Text(getHrs(value: getTotalWorkoutMin(val: day)))
                                        .font(.caption)
                                        .foregroundColor(Color("Color"))
                                        .padding(.bottom, 5)
                                
                                RoundedShape()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color")] ), startPoint: .top, endPoint: .bottom))
                                    // max height = 200
                                    .frame(height: getHeight(value: getTotalWorkoutMin(val: day)))
                            }
                            .frame(height: 220)
                        
                        
                        Text(day.dailyText)
                            .font(.caption)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .padding()
//        .cornerRadius(10)
//        .padding()
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

@main
struct FitnessWidget: Widget {
    let kind: String = "FitnessWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,  provider: Provider()) { entry in
            FitnessWidgetEntryView(entry: entry).environmentObject(MainViewModel())
                .frame(maxWidth: .infinity, maxHeight: .infinity)    // << here !!
                .background(Color("WidgetBackground"))
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }
}

struct FitnessWidget_Previews: PreviewProvider {
    static var previews: some View {
        FitnessWidgetEntryView(entry: Model(date: Date(), widgetData: Array(repeating: Daily(id: 15, day: 23, month:8, year: 2021, workoutInMin: 950), count: 6)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)    // << here !!
            .background(Color("WidgetBackground"))
            .previewContext(WidgetPreviewContext(family: .systemSmall)).environmentObject(MainViewModel())
    }
}


//// attaching completion handler to send back data
//func getData(completion: @escaping ([Daily]) -> ()) {
//    
//    let workoutData = [
//        Daily(id: 1, day: 1, month:4, year: 2019, workoutInMin: 2480),
//        Daily(id: 2, day: 1, month:4, year: 2021, workoutInMin: 480),
//        Daily(id: 3, day: 2, month:6, year: 2021, workoutInMin: 880),
//        Daily(id: 4, day: 3, month:7, year: 2021, workoutInMin: 250),
//        Daily(id: 5, day: 18, month:7, year: 2021, workoutInMin: 360),
//        Daily(id: 6, day: 19, month:7, year: 2021, workoutInMin: 1220),
//        Daily(id: 7, day: 22, month:7, year: 2021, workoutInMin: 750),
//        Daily(id: 8, day: 23, month:7, year: 2021, workoutInMin: 950),
//        Daily(id: 9, day: 1, month:8, year: 2021, workoutInMin: 480),
//        Daily(id: 10, day: 2, month:8, year: 2021, workoutInMin: 880),
//        Daily(id: 11, day: 3, month:8, year: 2021, workoutInMin: 250),
//        Daily(id: 12, day: 18, month:8, year: 2021, workoutInMin: 360),
//        Daily(id: 13, day: 19, month:8, year: 2021, workoutInMin: 1220),
//        Daily(id: 14, day: 22, month:8, year: 2021, workoutInMin: 750),
//        Daily(id: 15, day: 23, month:8, year: 2021, workoutInMin: 950)
//    ]
//    completion(workoutData)
//
//}
//
//
//let sampleData = [
//    Daily(id: 1, day: 1, month:4, year: 2019, workoutInMin: 2480),
//    Daily(id: 2, day: 1, month:4, year: 2021, workoutInMin: 480),
//    Daily(id: 3, day: 2, month:6, year: 2021, workoutInMin: 880),
//    Daily(id: 4, day: 3, month:7, year: 2021, workoutInMin: 250)
//]
