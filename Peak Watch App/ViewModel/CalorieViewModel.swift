//
//  CalorieViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import Foundation
import HealthKit

class CalorieViewModel: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published var activeCaloriesBurned: Double = 0.0
    @Published var totalCalories: Double = 0.0
    
    func fetchActiveCalories() {
        CalorieManager.shared.fetchActiveCaloriesBurned { activeCaloriesBurned in
            DispatchQueue.main.async {
                self.activeCaloriesBurned = activeCaloriesBurned
            }
        }
    }
    
    func fetchLatestTotalCalories() {
        CalorieManager.shared.fetchTotalCalories { totalCalories in
            DispatchQueue.main.async {
                self.totalCalories = totalCalories
            }
        }
    }
}
