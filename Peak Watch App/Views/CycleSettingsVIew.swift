//
//  CycleSettingsVIew.swift
//  Peak Watch App
//
//  Created by Lucky on 21/05/24.
//

import SwiftUI

struct CycleSettingsVIew: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = UserSettingsViewModel()
    
    @State private var totalCycle = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 3) {
                ZStack {
                    Rectangle()
                        .frame(width: 52, height: 17)
                        .foregroundStyle(.pYellow)
                        .cornerRadius(15)
                    
                    Text("CYCLES")
                          .font(.system(size: 11))
                          .foregroundColor(.black) 
                          .fontWeight(.bold)
                }
                //.padding(.bottom, 3)
                .padding(.top, 14)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 172, height: 77)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.75)
                            .stroke(.pYellow)
                        )
                        .opacity(0.14)
                    
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 172, height: 77)
                      .cornerRadius(8)
                      .overlay(
                        RoundedRectangle(cornerRadius: 8)
                          .inset(by: 0.75)
                          .stroke(.pYellow)
                      )
                    
                    Text("\(totalCycle)")
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    HStack {                            
                        Button(action: {
                            self.totalCycle -= 1
                        }) {
                            ZStack {
                                Circle()
                                  .frame(width: 36, height: 36)
                                  .foregroundStyle(.white)
                                  .background(.clear)
                                  .opacity(0.12)
                                
                                Image(systemName: "minus")
                                    .foregroundStyle(.pYellow)
                                    .font(.system(size: 18))
                            }
                            .padding(.leading, 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                        Button(action: {
                            self.totalCycle += 1
                        }) {
                            ZStack {
                                Circle()
                                  .frame(width: 36, height: 36)
                                  .foregroundStyle(.white)
                                  .background(.clear)
                                  .opacity(0.12)
                                
                                Image(systemName: "plus")
                                    .foregroundStyle(.pYellow)
                                    .font(.system(size: 18))
                            }
                            .padding(.trailing, 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(width: 172)
                }
            }
            
            Button { 
                viewModel.saveTotalCycle(totalCycle)
                
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
            .background(.pYellow)
            .cornerRadius(100)

        }
        .onAppear {
            totalCycle = viewModel.loadTotalCycle()
            
            print(totalCycle)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomButtonView(buttonColor: .pYellow, imageName: "chevron.backward")
            }
        }
        .navigationTitle {    
          Text("Interval")
                .font(.system(size: 17))
                .foregroundColor(.pYellow) 
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CycleSettingsVIew()
}
