//
//  HearRateViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import HealthKit

class UserDataViewModel: ObservableObject {
    
    @Published var zoneModel: ZoneModel?
    
    private var userAge: Int?
    private var restingHeartRate: Double = 0.0
    private var maximumHeartRate: Double = 0.0
    private var heartRateReserve: Double = 0.0
    
    func getYearOfBirth(completion: @escaping () -> Void) {
        UserDataManager.shared.getYearOfBirth { [weak self] age in
            DispatchQueue.main.async {
                self?.userAge = age
                completion()
            }
        }
    }
    
    func getLowestHeartRateForPastHour(completion: @escaping () -> Void) {
        HeartRateManager.shared.getLowestHeartRateForPastHour { [weak self] lowestHeartRate in
            if let lowestHeartRate = lowestHeartRate {
                DispatchQueue.main.async {
                    self?.restingHeartRate = lowestHeartRate
                    completion()
                }
            }
        }
    }
    
    func getMaximumHeartRate() -> Double {
        return abs((0.7 * Double(restingHeartRate)) - 207)
    }
    
    func getHeartRateReserve() -> Double {
        return abs(maximumHeartRate - Double(restingHeartRate))
    }
    
    func storeDataInZoneModel() {
        getYearOfBirth {
            self.getLowestHeartRateForPastHour {
                self.maximumHeartRate = self.getMaximumHeartRate()
                self.heartRateReserve = self.getHeartRateReserve()
                
                let newZoneModel = ZoneModel(userAge: self.userAge ?? 0,
                                             restingHeartRate: self.restingHeartRate,
                                             maximumHeartRate: self.maximumHeartRate,
                                             heartRateReserve: self.heartRateReserve)
                
                DispatchQueue.main.async {
                    self.zoneModel = newZoneModel
                }
            }
        }
    }
}

