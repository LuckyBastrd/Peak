//
//  ZoneModels.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import Foundation

struct ZoneModel {
    let age: Int
    let heartbeatsPer30Seconds: Int

    var maximumHeartRate: Double {
        return (0.7 * Double(age)) - 207
    }

    var restingHeartRate: Int {
        return heartbeatsPer30Seconds * 2
    }

    var heartRateReserve: Double {
        return maximumHeartRate - Double(restingHeartRate)
    }

    func targetHeartRate(for activity: Activity) -> (lowerBound: Double, upperBound: Double) {
        switch activity {
        case .walking:
            let lowerBound = (heartRateReserve * 0.5) + Double(restingHeartRate)
            let upperBound = (heartRateReserve * 0.7) + Double(restingHeartRate)
            return (lowerBound, upperBound)
        case .running:
            let lowerBound = (heartRateReserve * 0.7) + Double(restingHeartRate)
            let upperBound = (heartRateReserve * 0.85) + Double(restingHeartRate)
            return (lowerBound, upperBound)
        }
    }
    
    enum Activity {
        case walking
        case running
    }
}
