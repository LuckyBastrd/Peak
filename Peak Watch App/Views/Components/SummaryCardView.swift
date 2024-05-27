//
//  SummaryCardView.swift
//  Peak Watch App
//
//  Created by Lucky on 27/05/24.
//

import SwiftUI

struct SummaryCardView: View {
    
    var summaryTitle: String
    var summaryData: String
    var summaryColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Text(summaryTitle)
                  .font(.system(size: 16))
                  .fontWeight(.regular)
                  .frame(width: 172, height: 25, alignment: .leading)
                  .padding(.leading, 3)
            
            Text(summaryData)
                  .font(.system(size: 30))
                  .fontWeight(.medium)
                  .foregroundStyle(summaryColor)
                  .frame(width: 172, height: 25, alignment: .leading)
                  .padding(.leading, 3)
            
        }
        .frame(width: 172, height: 50, alignment: .leading)
    }
}

#Preview {
    SummaryCardView(summaryTitle: "ACTIVE KILOCALORIES" , summaryData: "00:14:00", summaryColor: .pYellow)
}
