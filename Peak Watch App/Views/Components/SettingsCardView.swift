//
//  SettingsListView.swift
//  Peak Watch App
//
//  Created by Lucky on 20/05/24.
//

import SwiftUI

struct SettingsCardView: View {
    
    let imageName: String
    let title: String
    let detail: String
    let backgroundColor: Color
    
    @Binding var isRedirectActive: Bool
    @Binding var navigateTo: String?
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: imageName)
                        .foregroundColor(backgroundColor)
                        .font(.system(size: 33))
                        .padding(.leading, 6)
                    
                    Spacer()
                    
                    Button { 
                        isRedirectActive = true
                        
                        if title == "Total Cycle" {
                            navigateTo = "cycle"
                        } 
                        else if title == "Walk Duration" {
                            navigateTo = "walk"
                        }
                        else if title == "Run Duration" {
                            navigateTo = "run"
                        }
                    } label: { 
                        ZStack {
                            Circle()
                                .frame(width: 23, height: 23)
                                .foregroundColor(backgroundColor)
                                .opacity(0.17)
                            
                            Image(systemName: "pencil")
                                .frame(width: 23, height: 23)
                                .foregroundColor(backgroundColor)
                                .font(.system(size: 13))
                        }
                        .padding(.trailing, 15)
                    }
                    .buttonStyle(PlainButtonStyle())


                }
                //.padding(.top, 13)
                .padding(.bottom, 13)
                
                Text(title)
                    .font(.system(size: 17))
                    .frame(width: 180, alignment: .leading)
                    .padding(.leading, 10)
                
                Text(detail)
                    .font(.system(size: 17))
                    .frame(width: 180, alignment: .leading)
                    .foregroundColor(backgroundColor)
                    .padding(.leading, 10)
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
    SettingsCardView(imageName: "figure", title: "ss", detail: "ss", backgroundColor: .pRed, isRedirectActive: .constant(true), navigateTo: .constant("a"))
}
