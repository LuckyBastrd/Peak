//
//  IntervalTimer.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import SwiftUI
import WatchKit

class IntervalTimer: ObservableObject {
    
    @Published var totalElapsedTime: Int = 0
    @Published var timeRemaining: Int = 0
    @Published var currentCycle = 0
    @Published var totalCycle = 0
    @Published var isRunning = false
    @Published var isPaused = false
    @Published var intervalType: IntervalType = .walk
    @Published var isCompleted: Bool = false

    private var timer: Timer?
    private var timeExtended: Bool = false
    private var settingsViewModel = UserSettingsViewModel()
    private var heartRateViewModel = HeartRateViewModel()
    private var zoneViewModel = ZoneViewModel()

    enum IntervalType {
        case walk, run
    }

    func startTimer() {
        guard let settings = settingsViewModel.loadAllSettings() else { return }
        resetTimer()
        currentCycle = 1
        intervalType = .walk
        timeRemaining = settings.walkDuration
        isRunning = true
        isPaused = false
        startInterval()
        
        heartRateViewModel.startHeartRateQuery()
        zoneViewModel.storeDataInZoneModel()
    }

    private func resetTimer() {
        timer?.invalidate()
    }

    private func startInterval() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.timerTick()
        }
    }

    private func timerTick() {
        guard let settings = settingsViewModel.loadAllSettings() else { return }
        
        timeRemaining -= 1
        
        if let zoneModel = zoneViewModel.zoneModel {
            
            let currentZone = intervalType == .walk ? zoneModel.walkingZone : zoneModel.runningZone
            
            if heartRateViewModel.heartRate < currentZone.lowerBound && timeRemaining <= 0 && !timeExtended {
                timeRemaining = intervalType == .walk ? 60 : 30
                timeExtended = true
                WKInterfaceDevice.current().play(.notification)
            }
            
            if heartRateViewModel.heartRate > currentZone.upperBound {
                intervalType = intervalType == .walk ? .run : .walk
                timeRemaining = intervalType == .walk ? settings.runDuration : settings.walkDuration
                timeExtended = false
                WKInterfaceDevice.current().play(.notification)
            }
        }
        
        if timeRemaining <= 0 {
            switch intervalType {
            case .walk:
                intervalType = .run
                timeRemaining = settings.runDuration
                timeExtended = false
                WKInterfaceDevice.current().play(.notification)
            case .run:
                if currentCycle < settings.totalCycle {
                    currentCycle += 1
                    intervalType = .walk
                    timeRemaining = settings.walkDuration
                    timeExtended = false
                    WKInterfaceDevice.current().play(.notification)
                } else {
                    stopTimer()
                    totalCycle = currentCycle
                    isCompleted = true
                }
            }
        }
        totalElapsedTime += 1
    }
    
    func skipCycle() {
        guard intervalType == .run else {
            return
        }

        guard let settings = settingsViewModel.loadAllSettings() else {
            return
        }

        if currentCycle < settings.totalCycle {
            currentCycle += 1
            timeRemaining = settings.walkDuration
            intervalType = .walk
        } else {
            stopTimer()
            totalCycle = currentCycle
            isCompleted = true
        }
    }

    func stopTimer() {
        resetTimer()
        isRunning = false
    }
    
    func pauseTimer() {
        resetTimer()
        isPaused = true
    }
    
    func resumeTimer() {
        if isPaused {
            startInterval()
            isPaused = false
            isRunning = true
        }
    }
    
    func saveTotalElapsedTime() {
        UserDefaults.standard.set(formattedTotalTimeElapsed, forKey: "totalElapsedTime")
    }

    
    var formattedTimeRemaining: String {
        let minutes = (timeRemaining % 3600) / 60
        let seconds = (timeRemaining % 3600) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var formattedTotalTimeElapsed: String {
        let hours = totalElapsedTime / 3600
        let minutes = (totalElapsedTime % 3600) / 60
        let seconds = (totalElapsedTime % 3600) % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

