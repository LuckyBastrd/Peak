//
//  SettingsModel.swift
//  Peak Watch App
//
//  Created by Lucky on 21/05/24.
//

import Foundation

class SettingsModel: Codable {
    
    var totalCycles: Int
    var walkTime: Int
    var runTime: Int
    
    init(totalCycles: Int, walkTime: Int, runTime: Int) {
        self.totalCycles = totalCycles
        self.walkTime = walkTime
        self.runTime = runTime
    }
}
