//
//  CalorieManager.swift
//  Peak Watch App
//
//  Created by Lucky on 27/05/24.
//

import Foundation
import HealthKit

class CalorieManager {
    
    static let shared = CalorieManager()
    
    private let healthStore = HKHealthStore()
    private var observerQuery: HKObserverQuery?

    func fetchTotalCalories(completion: @escaping (Double) -> Void) {
        fetchActiveCaloriesBurned { activeCalories in
            self.fetchRestingCalories { restingCalories in
                let totalCalories = activeCalories + restingCalories
                completion(totalCalories)
            }
        }
    }

    func fetchActiveCaloriesBurned(completion: @escaping (Double) -> Void) {
        guard let activeEnergyBurnedType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(0.0)
            return
        }

        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        observerQuery = HKObserverQuery(sampleType: activeEnergyBurnedType, predicate: predicate) { query, completionHandler, error in
            guard error == nil else {
                print("Error observing active calories burned: \(error!.localizedDescription)")
                completionHandler()
                return
            }
            self.executeActiveCaloriesQuery(completion: completion)
            completionHandler()
        }

        if let query = observerQuery {
            healthStore.execute(query)
        }
    }

    private func executeActiveCaloriesQuery(completion: @escaping (Double) -> Void) {
        guard let activeEnergyBurnedType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(0.0)
            return
        }

        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: activeEnergyBurnedType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            let activeCaloriesBurned = sum.doubleValue(for: HKUnit.kilocalorie())
            completion(activeCaloriesBurned)
        }

        healthStore.execute(query)
    }
    
    private func fetchRestingCalories(completion: @escaping (Double) -> Void) {
        guard let restingEnergyBurnedType = HKQuantityType.quantityType(forIdentifier: .basalEnergyBurned) else {
            completion(0.0)
            return
        }

        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: restingEnergyBurnedType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            let restingCaloriesBurned = sum.doubleValue(for: HKUnit.kilocalorie())
            completion(restingCaloriesBurned)
        }

        healthStore.execute(query)
    }
    
    func stopObservingActiveCaloriesBurned() {
        if let query = observerQuery {
            healthStore.stop(query)
        }
    }
}


