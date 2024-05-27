//
//  PeakApp.swift
//  Peak Watch App
//
//  Created by Lucky on 19/05/24.
//

import SwiftUI
import HealthKit

@main
struct Peak_Watch_AppApp: App {
    
    @StateObject private var healthKitManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .onAppear {
                        healthKitManager.requestAuthorization()
                    }
            }
        }
    }
}
