//
//  CalorieBurnedView.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import SwiftUI

struct CalorieBurnedView: View {
    
    @StateObject private var healthKitManager = HealthKitManager()
    @StateObject private var calorieViewModel = CalorieViewModel()
    
    var body: some View {
        VStack(spacing: 0) {            
            if healthKitManager.isAuthorized {
                HStack(spacing: 0) {
                    Text("\(Int(calorieViewModel.activeCaloriesBurned))")
                        .font(.system(size: 33))
                        .fontWeight(.medium)
                        .frame(width: calorieViewModel.activeCaloriesBurned == 0 ? 18 : 50, height: 22)
                        .padding(.trailing, calorieViewModel.activeCaloriesBurned == 0 ? 2 : 0)
                    
                    VStack(alignment: .leading, spacing: -3){
                        Text("TOTAL")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .kerning(0.5)
                            .foregroundColor(.white)
                            .opacity(0.98)
                        
                        Text("CAL")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .kerning(0.5)
                            .foregroundColor(.white)
                            .opacity(0.98)
                    }
                    .frame(width: 47, alignment: .leading)
                }
                .frame(width: 172, height: 22, alignment: .leading)
                .onAppear {
                    calorieViewModel.fetchActiveCalories()
                }
            } else {
                Text("Requesting Health Data Access...")
                    .onAppear {
                        healthKitManager.requestAuthorization()
                    }
            }
        }
    }
}

#Preview {
    CalorieBurnedView()
}
