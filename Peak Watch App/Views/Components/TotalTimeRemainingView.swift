//
//  TotalTimeRemainingView.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import SwiftUI

struct TotalTimeRemainingView: View {
    
    @EnvironmentObject private var intervalTimer: IntervalTimer
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0){
                Text("\(intervalTimer.formattedTotalTimeElapsed)")
                    .font(.system(size: 33))
                    .fontWeight(.medium)
                    .kerning(0.5)
                    .foregroundColor(.pYellow)
                    .opacity(0.98)
            }
            .frame(width: 172, height: 22, alignment: .leading)
        }
    }
}

//#Preview {
//    TotalTimeRemainingView()
//}
