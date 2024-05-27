//
//  TimeUtilities.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import Foundation

func convertSecondsToMinutes(seconds: Int) -> String {
    
    if seconds < 60 {
        return "\(seconds) seconds"
    }else {
        
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60

        if remainingSeconds == 0 {
            return "\(minutes) minutes"
        }else {
            let formattedMinutes = String(format: "%02d", minutes)
            let formattedSeconds = String(format: "%02d", remainingSeconds)
            return "\(formattedMinutes).\(formattedSeconds) minutes"
        }
    }
}

func separateMinutesAndSeconds(totalTimeInSeconds: Int) -> (minutes: Int, seconds: Int) {
    let minutes = totalTimeInSeconds / 60
    let seconds = totalTimeInSeconds % 60
    return (minutes, seconds)
}
