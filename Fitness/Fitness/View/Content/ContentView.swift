//
//  ContentView.swift
//  Fitness
//
//  Created by Asil Arslan on 22.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State var index = 0
    @State var selected = 0
    @State var selectedDateForWeek: Date?
    @State var selectedDateForMonth: Date?
    var colors = [Color("Color1"), Color("Color")]
    
    var body: some View {
        VStack {
            VStack(spacing: 10){
                
                HStack{
                    
                    Text("Fitness")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding(.horizontal)
                
                HStack{
                    
                    Button(action: {
                        withAnimation(.spring()){
                            self.index = 0
                        }
                        
                    }) {
                        
                        Text("Week")
                            .foregroundColor(self.index == 0 ? .black : .white)
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 20)
                    }
                    .background(self.index == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            self.index = 1
                        }
                        
                    }) {
                        
                        Text("Month")
                            .foregroundColor(self.index == 1 ? .black : .white)
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 20)
                    }
                    .background(self.index == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            self.index = 2
                        }
                        
                    }) {
                        
                        Text("Year")
                            .foregroundColor(self.index == 2 ? .black : .white)
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 20)
                    }
                    .background(self.index == 2 ? Color.white : Color.clear)
                    .clipShape(Capsule())
                    
                }
                .background(Color.black.opacity(0.25))
                .clipShape(Capsule())
                .padding(.top, 10)
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            
            
            // Bar Charts
            ZStack {
                if index == 0 {
                    
                    WeekView()
                        .environmentObject(mainViewModel)
                    
                }else if index == 1 {
                    
                    MonthView()
                        .environmentObject(mainViewModel)
                    
                }else if index == 2 {
                    YearView()
                        .environmentObject(mainViewModel)
                }
                
            }
            
            Spacer()
        }
        .background(Color("ColorBackground"))
        .edgesIgnoringSafeArea(.all)
        
        
        
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MainViewModel())
    }
}


