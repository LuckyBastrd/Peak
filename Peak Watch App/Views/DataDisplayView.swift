//
//  DataDisplayView.swift
//  Peak Watch App
//
//  Created by Lucky on 27/05/24.
//

import SwiftUI

struct DataDisplayView: View {
    
    @EnvironmentObject private var intervalTimer: IntervalTimer
    
    @Binding var isTimerStarted: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            
            // TOP
            VStack(spacing: 5) {
                
                TimeElapsedView()
                
                TimeRemainingView()
            }
            .padding(.top, 10)
            
            // BOTTOM
            VStack(spacing: 13) {
                
                TotalCycleView()
                
                HeartRateView()
                
                CalorieBurnedView()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $intervalTimer.isCompleted) {
            SummaryView(intervalTimer: intervalTimer)
                .navigationBarBackButtonHidden()
        }
        .onAppear {
            if !isTimerStarted {
                intervalTimer.startTimer()
                
                isTimerStarted = true
            }
        }
    }
}
