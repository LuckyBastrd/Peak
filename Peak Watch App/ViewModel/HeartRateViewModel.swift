//
//  HearRateViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import HealthKit

class HeartRateViewModel: ObservableObject {
    
    @Published var heartRate: Double = 0.0
    
    func startHeartRateQuery() {
        HeartRateManager.shared.startHeartRateQuery { [weak self] samples in
            self?.process(samples)
        }
    }

    private func process(_ samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }

        DispatchQueue.main.async {
            self.heartRate = samples.last?.quantity.doubleValue(for: .count().unitDivided(by: .minute())) ?? 0.0
        }
    }
}

