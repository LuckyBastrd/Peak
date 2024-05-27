//
//  UserSettingsView.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import SwiftUI

struct UserSettingsView: View {
    
    @ObservedObject var viewModel = UserSettingsViewModel()
    
    @State private var isRedirectActive: Bool = false
    @State private var navigateTo: String? = nil
    
    @State private var totalCycleSaved : Int = 0
    @State private var walkDurationSaved : String = " "
    @State private var runDurationSaved : String = " "
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                SettingsCardView(
                    imageName: "repeat", 
                    title: "Total Cycle", 
                    detail: "\(totalCycleSaved) Cycle", 
                    backgroundColor: .pYellow, 
                    isRedirectActive: $isRedirectActive, 
                    navigateTo: $navigateTo
                )
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 1)
                
                SettingsCardView(
                    imageName: "figure.walk", 
                    title: "Walk Duration", 
                    detail: "\(walkDurationSaved)", 
                    backgroundColor: .pBlue, 
                    isRedirectActive: $isRedirectActive, 
                    navigateTo: $navigateTo
                )
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 1)
                
                SettingsCardView(
                    imageName: "figure.run", 
                    title: "Run Duration", 
                    detail: "\(runDurationSaved)",
                    backgroundColor: .pGreen, 
                    isRedirectActive: $isRedirectActive, 
                    navigateTo: $navigateTo
                )
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 1)
                
                StartButtonView()
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 1)
            }
            .listStyle(.carousel)
        }
        .onAppear{
            totalCycleSaved = viewModel.loadTotalCycle()
            
            walkDurationSaved = convertSecondsToMinutes(seconds: viewModel.loadWalkDuration())
            
            runDurationSaved = convertSecondsToMinutes(seconds: viewModel.loadRunDuration())
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomButtonView(buttonColor: .pRed, imageName: "chevron.backward")
            }
        }
        .navigationDestination(isPresented: $isRedirectActive) {
            if navigateTo == "cycle" {
                CycleSettingsVIew()
            } 
            else if navigateTo == "walk" {
                WalkSettingsView()
            }
            else if navigateTo == "run" {
                RunSettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}

