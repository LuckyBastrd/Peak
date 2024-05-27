//
//  SummaryView.swift
//  Peak Watch App
//
//  Created by Lucky on 27/05/24.
//

import SwiftUI

struct SummaryView: View {
    
    @ObservedObject var intervalTimer: IntervalTimer
    @StateObject private var calorieViewModel = CalorieViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                SummaryCardView(summaryTitle: "TOTAL TIME", summaryData: intervalTimer.formattedTotalTimeElapsed, summaryColor: .pYellow)
                Divider()
                    .padding(.horizontal)
                
                SummaryCardView(summaryTitle: "TOTAL CYCLE", summaryData: "\(intervalTimer.totalCycle) CYCLE", summaryColor: .pBlue)
                Divider()
                    .padding(.horizontal)
                
                SummaryCardView(summaryTitle: "ACTIVE KILOCALORIES", summaryData: "\(Int(calorieViewModel.activeCaloriesBurned)) KCAL" , summaryColor: .pRed)
                Divider()
                    .padding(.horizontal)
                
                SummaryCardView(summaryTitle: "TOTAL KILOCALORIES", summaryData: "\(Int(calorieViewModel.totalCalories)) KCAL" , summaryColor: .pRed)
                Divider()
                    .padding(.horizontal)
            }

            
        }
        .onAppear {
            calorieViewModel.fetchLatestTotalCalories()
            calorieViewModel.fetchLatestTotalCalories()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomButtonView(buttonColor: .white, imageName: "xmark")
            }
        }
        .navigationTitle {    
            Text("Summary")
                  .font(.system(size: 17))
                  .foregroundColor(.pRed) 
        }
    }
}

//#Preview {
//    SummaryView()
//}
