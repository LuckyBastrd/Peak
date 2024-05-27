//
//  HeartRateManager.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import Foundation
import HealthKit

class HeartRateManager {
    
    static let shared = HeartRateManager()
    
    private let healthStore = HKHealthStore()
    
    func startHeartRateQuery(completion: @escaping ([HKSample]?) -> Void) {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }

        let predicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
        
        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }

        query.updateHandler = { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }

        healthStore.execute(query)
    }
    
    func getLowestHeartRateForPastHour(completion: @escaping (Double?) -> Void) {
         let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
         
         let now = Date()
         guard let oneHourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: now) else {
             completion(nil)
             return
         }
         
         let predicate = HKQuery.predicateForSamples(withStart: oneHourAgo, end: now, options: .strictStartDate)
         
         let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
             guard let samples = results as? [HKQuantitySample], !samples.isEmpty else {
                 completion(nil)
                 return
             }
             
             let lowestHeartRate = samples.map { $0.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute())) }.min()
             completion(lowestHeartRate)
         }
         
         healthStore.execute(query)
     }
}
