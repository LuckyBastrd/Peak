//
//  ControlView.swift
//  Peak Watch App
//
//  Created by Lucky on 27/05/24.
//

import SwiftUI

struct ControlView: View {
    
    @EnvironmentObject private var intervalTimer: IntervalTimer
    
    @Binding var isPaused: Bool
    @Binding var isEnd: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8){
                
                Button { 
                    isEnd = true
                    
                    intervalTimer.stopTimer()
                } label: { 
                    VStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 172, height: 42)
                              .background(.pRed)
                              .cornerRadius(22)
                              .opacity(0.27)
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 32))
                                .kerning(0.1)
                                .foregroundColor(.pRed)
                                .frame(width: 21, height: 21)
                        }
                        
                        Text("End")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                    }
                }
                .buttonStyle(PlainButtonStyle())

                
                Button(action: {
                    
                    self.isPaused.toggle()
                    
                    if isPaused == true {
                        intervalTimer.pauseTimer()
                    } else {
                        intervalTimer.resumeTimer()
                    }
                    
                }) {
                    VStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 172, height: 42)
                                .background(.pYellow)
                                .cornerRadius(22)
                                .opacity(0.27)
                            
                            Image(systemName: isPaused ? "arrow.clockwise" : "pause")
                                .font(.system(size: 32))
                                .kerning(0.1)
                                .foregroundColor(.pYellow)
                                .frame(width: 21, height: 21)
                        }
                        
                        Text(isPaused ? "Resume" : "Pause")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.bottom, 12)
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $isEnd) {
            MainView()
                .navigationBarBackButtonHidden()
        }
    }
}
