//
//  TestSomeView.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import SwiftUI
//struct TestSomeView: View {
//    @State private var selection = 1 // Index of "Page Two"
//
//    var body: some View {
//        TabView(selection: $selection) {
//            Text("Page One")
//                .tag(0)
//            Text("Page Two")
//                .tag(1)
//            Text("Page Three")
//                .tag(2)
//        }
//        .tabViewStyle(PageTabViewStyle())
////        .onAppear {
////            // Set the selection to 1 when the view appears to make "Page Two" the default
////            selection = 1
////        }
//    }
//}

struct TestSomeView: View {
    @StateObject private var healthKitManager = HealthKitManager()
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    @StateObject private var zoneViewModel = ZoneViewModel()

    var body: some View {
        VStack {
            if healthKitManager.isAuthorized {
//                Text("Year: \(userDataViewModel.age ?? 21)")
//                    .font(.system(size: 33))
//                    .onAppear {
//                        userDataViewModel.getYearOfBirth()
//                    }
//                
//                Text("Rest: \(userDataViewModel.restingHeartRate)")
//                    .font(.system(size: 33))
//                    .onAppear {
//                        userDataViewModel.getLowestHeartRateForPastHour()
//                    }
                
                VStack {
                    Text("\(heartRateViewModel.heartRate)")
                }
                .onAppear {
                    heartRateViewModel.startHeartRateQuery()
                    zoneViewModel.storeDataInZoneModel()
                }
                .padding()
            }else {
                Text("Requesting Health Data Access...")
                    .onAppear {
                        healthKitManager.requestAuthorization()
                    }
            }
//            if healthKitManager.isAuthorized {
//                HStack(spacing: 0) {
//                    Text("\(Int(heartRateViewModel.restingHeartRate))")
//                        .font(.system(size: 33))
//                        .fontWeight(.medium)
//                }
//                .frame(width: 172, height: 22, alignment: .leading)
//                .onAppear {
//                    heartRateViewModel.fetchLatestActiveEnergyBurned()
//                }
//            }else {
//                Text("Requesting Health Data Access...")
//                    .onAppear {
//                        healthKitManager.requestAuthorization()
//                    }
//            }
        }
        
//        VStack {
//            if healthKitManager.isAuthorized {
//                HStack(spacing: 0) {
//                    Text("\(Int(heartRateViewModel.restingHeartRate))")
//                        .font(.system(size: 33))
//                        .fontWeight(.medium)
//                }
//                .frame(width: 172, height: 22, alignment: .leading)
//                .onAppear {
//                    let specificDate = Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 25))!
//                    heartRateViewModel.getLowestHeartRateForToday()
//                }
//            }else {
//                Text("Requesting Health Data Access...")
//                    .onAppear {
//                        healthKitManager.requestAuthorization()
//                    }
//            }
//        }
    }
}

//#Preview {
//    TestSomeView()
//        .environmentObject(HealthKitManager()) // Provide a mock HealthKitManager
//}
