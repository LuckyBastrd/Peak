//
//  HealthKitManager.swift
//  Peak Watch App
//
//  Created by Lucky on 21/05/24.
//

import HealthKit

class HealthKitManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    @Published var isAuthorized: Bool = false

    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            // Health data is not available on this device
            return
        }
        
        let sampleTypesToRead = Set([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!,
        ])
        
        healthStore.requestAuthorization(toShare: nil, read: sampleTypesToRead) { (success, error) in
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                } else {
                    // Handle error or show an alert to the user
                    self.isAuthorized = false
                }
            }
        }
    }
}
