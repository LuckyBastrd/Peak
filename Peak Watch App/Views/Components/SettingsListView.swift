//
//  SettingsListView.swift
//  Peak Watch App
//
//  Created by Lucky on 20/05/24.
//

import SwiftUI

struct SettingsListView: View {
    
    let imageName: String
    let title: String
    let detail: String
    let backgroundColor: Color
    let isLast: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: imageName)
                        .foregroundColor(backgroundColor)
                        .font(.system(size: 34))
                        .padding(.leading, 6)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: 23, height: 23)
                            .foregroundColor(backgroundColor)
                            .opacity(0.17)
                        Image(systemName: "pencil")
                            .foregroundColor(backgroundColor)
                            .font(.system(size: 16))
                    }
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 13)
                
                Text(title)
                    .frame(width: 180, alignment: .leading)
                    .padding(.leading, 2)
                
                Text(detail)
                    .frame(width: 180, alignment: .leading)
                    .foregroundColor(backgroundColor)
                    .padding(.leading, 2)
            }
        }
        .frame(height: 107)
        .listRowBackground(
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 107)
                .background(backgroundColor)
                .opacity(0.17)
                .cornerRadius(18)
        )
    }
}

#Preview {
    SettingsListView(imageName: "figure", backgroundColor: .pRed, title: "s", detail: "s")
}
