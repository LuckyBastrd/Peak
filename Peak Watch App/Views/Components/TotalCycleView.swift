//
//  TotalCycleView.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import SwiftUI

struct TotalCycleView: View {
    
    @EnvironmentObject private var intervalTimer: IntervalTimer
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0){
                Text("\(intervalTimer.currentCycle) CYCLE")
                    .font(.system(size: 33))
                    .fontWeight(.medium)
            }
            .frame(width: 172, height: 22, alignment: .leading)
        }
    }
}
