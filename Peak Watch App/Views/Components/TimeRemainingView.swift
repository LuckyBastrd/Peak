//
//  TimeRemainingView.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import SwiftUI

struct TimeRemainingView: View {
    
    @EnvironmentObject private var intervalTimer: IntervalTimer
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .frame(width: 150,height: 35)
                    .foregroundColor(.clear)
                    .background(.pRed)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 5,
                            topTrailingRadius: 5
                        )
                    )
                    .opacity(0.27)
                    .offset(x: -30, y: 0) // Adjusted offset
                
                HStack(spacing: 0) {
                    Text("\(intervalTimer.formattedTimeRemaining)")
                        .font(.system(size: 33))
                        .frame(width: 85, height: 22, alignment: .leading)
                        .fontWeight(.medium)
                    
                    VStack(alignment: .leading, spacing: -3){
                        Text("\(intervalTimer.intervalType == .walk ? "WALK" : "RUN")")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .kerning(0.5)
                            .foregroundColor(.white)
                            .opacity(0.98)
                        
                        Text("TIME")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .kerning(0.5)
                            .foregroundColor(.white)
                            .opacity(0.98)
                    }
                    .frame(width: 47, alignment: .leading)
                }
                .frame(width: 172, height: 22, alignment: .leading)
            }
        }
    }
}

//#Preview {
//    TimeRemainingView()
//}
