////
////  HKTestView.swift
////  Peak Watch App
////
////  Created by Lucky on 21/05/24.
////
//
//import SwiftUI
//import HealthKit
//
//struct HKTestView: View {
//    
//    @EnvironmentObject var healthStore: HKHealthStore
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//            
//            Button { 
//                readHeartRate()
//            } label: { 
//                Text("SEHAT NIH")
//            }
//
//        }
//        .padding()
////        .onAppear(){
////            readHeartRate()
////        }
//    }
//    
//    //MARK: - Read heart rate
//    
//    private func readHeartRate(){
//        let quantityType  = HKObjectType.quantityType(forIdentifier: .heartRate)!
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
//        let sampleQuery = HKSampleQuery.init(sampleType: quantityType,
//                                             predicate: get24hPredicate(),
//                                             limit: HKObjectQueryNoLimit,
//                                             sortDescriptors: [sortDescriptor],
//                                             resultsHandler: { (query, results, error) in
//            
//            guard let samples = results as? [HKQuantitySample] else {
//                print(error!)
//                return
//            }
//            let mSample = samples[0].quantity.doubleValue(for: HKUnit(from: "count/min"))
//            print("Heart rate : \(mSample)")            
//        })
//        self.healthStore .execute(sampleQuery)
//        
//    }
//    
//    private func get24hPredicate() ->  NSPredicate{
//        let today = Date()
//        let startDate = Calendar.current.date(byAdding: .hour, value: -24, to: today)
//        let predicate = HKQuery.predicateForSamples(withStart: startDate,end: today,options: [])
//        return predicate
//    }
//}
//
//import SwiftUI
//import HealthKit
//
//struct HKTestView: View {
//    @State private var heartRate: Double = 0.0
//    let healthStore = HKHealthStore()
//    
//    var body: some View {
//        VStack {
//            Text("Heart Rate: \(Int(heartRate)) BPM")
//                .padding()
//        }
//        .onAppear {
//            authorizeHealthKit()
//            startHeartRateMonitoring()
//        }
//    }
//    
//    private func authorizeHealthKit() {
//        let typesToRead: Set<HKSampleType> = [HKObjectType.quantityType(forIdentifier: .heartRate)!]
//        
//        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
//            if let error = error {
//                print("Error requesting HealthKit authorization: \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    private func startHeartRateMonitoring() {
//        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
//        let query = HKObserverQuery(sampleType: heartRateType, predicate: nil) { (query, completionHandler, error) in
//            guard error == nil else {
//                print("Error observing heart rate changes: \(error!.localizedDescription)")
//                return
//            }
//            self.fetchLatestHeartRate()
//        }
//        healthStore.execute(query)
//    }
//    
//    private func fetchLatestHeartRate() {
//        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
//        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
//            guard error == nil, let samples = samples as? [HKQuantitySample], let sample = samples.first else {
//                print("Error querying heart rate: \(error!.localizedDescription)")
//                return
//            }
//            DispatchQueue.main.async {
//                self.heartRate = sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute()))
//            }
//        }
//        healthStore.execute(query)
//    }
//}

import SwiftUI
import HealthKit

struct HKTestView: View {
    @State private var pace: Double = 0.0
    let healthStore = HKHealthStore()
    
    var body: some View {
        VStack {
            Text("Current Pace: \(pace) meters per second")
                .padding()
        }
        .onAppear {
            requestAuthorization()
            startFetchingPaceData()
        }
    }
    
    private func requestAuthorization() {
        let typesToRead: Set<HKSampleType> = [
            HKObjectType.workoutType(),
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if !success {
                // Handle error
            }
        }
    }
    
    private func startFetchingPaceData() {
        let distanceType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let query = HKSampleQuery(sampleType: distanceType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
            guard let samples = samples as? [HKQuantitySample], let sample = samples.last else {
                // Handle error
                return
            }
            
            let distance = sample.quantity.doubleValue(for: HKUnit.meter())
            let duration = sample.endDate.timeIntervalSince(sample.startDate)
            let currentPace = distance / duration
            
            DispatchQueue.main.async {
                self.pace = currentPace
            }
        }
        
        healthStore.execute(query)
    }
}
