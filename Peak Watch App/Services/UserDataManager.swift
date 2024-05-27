//
//  UserDataManager.swift
//  Peak Watch App
//
//  Created by Lucky on 26/05/24.
//

import Foundation
import HealthKit

class UserDataManager {
    
    static let shared = UserDataManager()
    
    private let healthStore = HKHealthStore()
    
    func getYearOfBirth(completion: @escaping (Int?) -> Void) {
        do {
            let birthDay = try healthStore.dateOfBirthComponents()
            let calendar = Calendar.current
            let currentYear = calendar.component(.year, from: Date())
            let age = currentYear - birthDay.year!
            completion(age)
        } catch {
            completion(nil)
        }
    }
}
