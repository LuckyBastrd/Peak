//
//  WalkSettingsView.swift
//  Peak Watch App
//
//  Created by Lucky on 22/05/24.
//

import SwiftUI

struct WalkSettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = UserSettingsViewModel()
    
    @State private var walkDuration = 0
    
    var body: some View {
        VStack(spacing: 5) {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(width: 62, height: 17)
                        .foregroundStyle(.pBlue)
                        .cornerRadius(15)
                    
                    Text("MINUTES")
                          .font(.system(size: 11))
                          .foregroundColor(.black) 
                          .fontWeight(.bold)
                }
                .padding(.bottom, 3)
                
                Picker("Select a minutes", selection: $walkDuration)
                {
                    ForEach(1..<60, id: \.self) { minute in
                        Text("\(minute)")
                            .font(.system(size: 26))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                .labelsHidden()
                .pickerStyle(WheelPickerStyle())
                .frame(width: 172, height: 77)
                .background(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.pBlue, lineWidth: 2)
                )
                
                Spacer()
            }
            .padding(.top, 14)
            
            Spacer()
            
            Button { 
                let totalWalkDuration = (walkDuration * 60)
                
                viewModel.saveWalkDuration(totalWalkDuration)
                
                dismiss()
            } label: { 
                Text("Done")
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                    .kerning(0.1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            .frame(width: 172, height: 54)
            .background(.pBlue)
            .cornerRadius(100)
        }
        .onAppear {
            walkDuration = viewModel.loadWalkDuration() / 60
            
            print(walkDuration)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomButtonView(buttonColor: .pBlue, imageName: "chevron.backward")
            }
        }
        .navigationTitle {    
          Text("Walk Time")
                .font(.system(size: 17))
                .foregroundColor(.pBlue) 
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    WalkSettingsView()
}
