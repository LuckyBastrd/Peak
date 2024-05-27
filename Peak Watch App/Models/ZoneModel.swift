//
//  ZoneModel.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import Foundation

struct ZoneModel {
    var userAge: Int?
    var restingHeartRate: Double
    var maximumHeartRate: Double
    var heartRateReserve: Double
    
    var walkingZone: (lowerBound: Double, upperBound: Double) {
        let lowerBound = (heartRateReserve * 0.5) + restingHeartRate
        let upperBound = (heartRateReserve * 0.7) + restingHeartRate
        return (lowerBound, upperBound)
    }
    
    var runningZone: (lowerBound: Double, upperBound: Double) {
        let lowerBound = (heartRateReserve * 0.7) + restingHeartRate
        let upperBound = (heartRateReserve * 0.85) + restingHeartRate
        return (lowerBound, upperBound)
    }
}
