//
//  UserSettingsViewModel.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import Foundation
import Combine

class UserSettingsViewModel: ObservableObject {
    
    private let userDefaultsKey = "UserSettingsKey"
    
    init() {
        // Check if settings exist, if not, set default values and save
        if loadAllSettings() == nil {
            saveTotalCycle(4)
            saveWalkDuration(180)
            saveRunDuration(30)
        }
    }
    
    /// Save Data
    func saveTotalCycle(_ totalCycle: Int) {
        var settings = loadAllSettings() ?? UserSettingsModel(totalCycle: 0, walkDuration: 0, runDuration: 0)
        settings.totalCycle = totalCycle
        saveSettings(settings)
    }
    
    func saveWalkDuration(_ walkDuration: Int) {
        var settings = loadAllSettings() ?? UserSettingsModel(totalCycle: 0, walkDuration: 0, runDuration: 0)
        settings.walkDuration = walkDuration
        saveSettings(settings)
    }
    
    func saveRunDuration(_ runDuration: Int) {
        var settings = loadAllSettings() ?? UserSettingsModel(totalCycle: 0, walkDuration: 0, runDuration: 0)
        settings.runDuration = runDuration
        saveSettings(settings)
    }
    
    private func saveSettings(_ settings: UserSettingsModel) {
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    /// Load Data
    func loadTotalCycle() -> Int {
         if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
            let settings = try? JSONDecoder().decode(UserSettingsModel.self, from: data) {
             return settings.totalCycle
         }
         return 0
     }
    
    func loadWalkDuration() -> Int {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let settings = try? JSONDecoder().decode(UserSettingsModel.self, from: data) {
            return settings.walkDuration
        }
        return 0
    }
    
    func loadRunDuration() -> Int {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let settings = try? JSONDecoder().decode(UserSettingsModel.self, from: data) {
            return settings.runDuration
        }
        return 0
    }
    
    func loadAllSettings() -> UserSettingsModel? {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let settings = try? JSONDecoder().decode(UserSettingsModel.self, from: data) {
            return settings
        }
        return nil
    }
}
