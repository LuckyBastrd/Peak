//
//  RunSettingsView.swift
//  Peak Watch App
//
//  Created by Lucky on 22/05/24.
//

import SwiftUI

struct RunSettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = UserSettingsViewModel()
    
    @State private var runDurationMinute = 0
    @State private var runDurationSecond = 0
    @State private var isMinutePickerSelected: Bool = true
    @State private var isSecondPickerSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {                    
                    VStack(spacing: 0) {
                        if isMinutePickerSelected {
                            ZStack {
                                Rectangle()
                                    .frame(width: 60, height: 17)
                                    .foregroundStyle(.pGreen)
                                    .cornerRadius(15)
                                
                                Text("MINUTES")
                                      .font(.system(size: 11))
                                      .foregroundColor(.black) 
                                      .fontWeight(.bold)
                            }
                            .padding(.bottom, 3)
                        } else {
                            Rectangle()
                                .frame(width: 60, height: 17)
                                .foregroundStyle(.clear)
                                .padding(.bottom, 3)
                        }
                        
                        Picker("Select a minutes", selection: $runDurationMinute)
                        {
                            ForEach(0..<60, id: \.self) { minute in
                                Text("\(minute)")
                                    .font(.system(size: 26))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 65, height: 77)
                        .background(Color.white.opacity(0.05))
                        .onTapGesture {
                             isMinutePickerSelected = true
                             isSecondPickerSelected = false
                         }
                    }
                    
                    Spacer()
                    
                    Text(":")
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                        .foregroundStyle(.pGreen)
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        if isSecondPickerSelected {
                            ZStack {
                                Rectangle()
                                    .frame(width: 60, height: 17)
                                    .foregroundStyle(.pGreen)
                                    .cornerRadius(15)
                                
                                Text("SECONDS")
                                      .font(.system(size: 11))
                                      .foregroundColor(.black) 
                                      .fontWeight(.bold)
                            }
                            .padding(.bottom, 3)
                        } else {
                            Rectangle()
                                .frame(width: 60, height: 17)
                                .foregroundStyle(.clear)
                                .padding(.bottom, 3)
                        }
                        
                        Picker("Select a seconds", selection: $runDurationSecond)
                        {
                            ForEach(0..<60, id: \.self) { minute in
                                Text("\(minute)")
                                    .font(.system(size: 26))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 65, height: 77)
                        .background(Color.white.opacity(0.05))
                        .onTapGesture {
                             isMinutePickerSelected = false
                             isSecondPickerSelected = true
                         }
                    }
                }
                
                Spacer()
            }
            .padding(.top, 14)
            .padding(.horizontal, 10)
            
            Spacer()
            
            Button { 
                let totalRunDuration = (runDurationMinute * 60) + runDurationSecond
                
                viewModel.saveRunDuration(totalRunDuration)
                
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
            .background(.pGreen)
            .cornerRadius(100)
        }
        .onAppear {
            let seperatedTime = separateMinutesAndSeconds(totalTimeInSeconds: viewModel.loadRunDuration())
            
            runDurationMinute = seperatedTime.minutes
            
            runDurationSecond = seperatedTime.seconds
            
            print(viewModel.loadRunDuration())
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomButtonView(buttonColor: .pGreen, imageName: "chevron.backward")
            }
        }
        .navigationTitle {    
          Text("Run Time")
                .font(.system(size: 17))
                .foregroundColor(.pGreen) 
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RunSettingsView()
}
