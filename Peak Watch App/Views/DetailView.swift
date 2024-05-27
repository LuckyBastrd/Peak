//
//  DetailView.swift
//  Peak Watch App
//
//  Created by Lucky on 21/05/24.
//

import SwiftUI
import HealthKit

struct DetailView: View {
    
    @StateObject private var intervalTimer = IntervalTimer()
    
    @State private var tabViewSelection = 2
    
    @State private var isTimerStarted = false
    @State private var isPaused = false
    @State private var isEnd = false
    @State private var navigateToSummary = false

    var body: some View {
        
        TabView(selection: $tabViewSelection) {
            ControlView(isPaused: $isPaused, isEnd: $isEnd).tag(1)
            
            DataDisplayView(isTimerStarted: $isTimerStarted).tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomSymbolView(buttonColor: .pRed, imageName: intervalTimer.intervalType == .walk ? "figure.walk" : "figure.run")
            }
        }
        .navigationTitle {    
          if isPaused == true {
              Text("PAUSE")
                    .font(.system(size: 17))
                    .foregroundColor(.pRed) 
          } else {
              Text("\(intervalTimer.intervalType == .walk ? "WALK" : "RUN")")
                    .font(.system(size: 17))
                    .foregroundColor(.pRed) 
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(intervalTimer)
    }
}


#Preview {
    DetailView()
}
