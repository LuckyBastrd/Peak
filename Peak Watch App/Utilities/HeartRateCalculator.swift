//
//  HeartRateCalculator.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

//import Foundation
//import SwiftUI
//
//struct HeartRateCalculator {
//    
//    @StateObject private var userDataViewModel = UserDataViewModel()
//    
//    init() {
//        userDataViewModel.getYearOfBirth()
//        userDataViewModel.getLowestHeartRateForPastHour()
//    }
//
//    var maximumHeartRate: Double {
//        return abs((0.7 * Double(userDataViewModel.restingHeartRate)) - 207)
//    }
//
//    var heartRateReserve: Double {
//        return maximumHeartRate - Double(userDataViewModel.restingHeartRate)
//    }
//
//    func targetHeartRate(for activity: Activity) -> (lowerBound: Double, upperBound: Double) {
//        switch activity {
//        case .walking:
//            let lowerBound = (heartRateReserve * 0.5) + Double(userDataViewModel.restingHeartRate)
//            let upperBound = (heartRateReserve * 0.7) + Double(userDataViewModel.restingHeartRate)
//            return (lowerBound, upperBound)
//        case .running:
//            let lowerBound = (heartRateReserve * 0.7) + Double(userDataViewModel.restingHeartRate)
//            let upperBound = (heartRateReserve * 0.85) + Double(userDataViewModel.restingHeartRate)
//            return (lowerBound, upperBound)
//        }
//    }
//    
//    enum Activity {
//        case walking
//        case running
//    }
//}


//
//  ZoneViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//
//
//import Foundation
//import Combine
//
//class ZoneViewModel: ObservableObject {
//    
//    var userDataViewModel: UserDataViewModel
//    
//    @Published var zoneModel: ZoneModel?
//    
//    private var cancellables = Set<AnyCancellable>()
//    
//    init(userDataViewModel: UserDataViewModel) {
//        self.userDataViewModel = userDataViewModel
//        self.userDataViewModel.getYearOfBirth()
//        self.userDataViewModel.getLowestHeartRateForPastHour()
//        
//        // Subscribe to zoneModel changes in UserDataViewModel
//        userDataViewModel.$zoneModel
//            .sink { [weak self] zoneModel in
//                self?.zoneModel = zoneModel
//            }
//            .store(in: &cancellables)
//    }
//
//    var maximumHeartRate: Double {
//        if let zoneModel = zoneModel {
//            let calculatedRate = (0.7 * Double(zoneModel.userAge)) - 207
//            return abs(calculatedRate)
//        } else {
//            return 0
//        }
//    }
//
//    var heartRateReserve: Double {
//        if let zoneModel = zoneModel {
//            return maximumHeartRate - Double(zoneModel.userRestingHeartRate)
//        } else {
//            return 0
//        }
//    }
//
//    func targetHeartRate(for activity: ZoneModel.Activity) -> (lowerBound: Double, upperBound: Double) {
//        guard let zoneModel = zoneModel else {
//            return (0, 0)
//        }
//        
//        switch activity {
//        case .walk:
//            let lowerBound = (heartRateReserve * 0.5) + Double(zoneModel.userRestingHeartRate)
//            let upperBound = (heartRateReserve * 0.7) + Double(zoneModel.userRestingHeartRate)
//            return (lowerBound, upperBound)
//        case .run:
//            let lowerBound = (heartRateReserve * 0.7) + Double(zoneModel.userRestingHeartRate)
//            let upperBound = (heartRateReserve * 0.85) + Double(zoneModel.userRestingHeartRate)
//            return (lowerBound, upperBound)
//        }
//    }
//}
