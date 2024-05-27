////
////  SettingsView.swift
////  Peak Watch App
////
////  Created by Lucky on 20/05/24.
////
//
//import SwiftUI
//
//struct SettingsView: View {
//    
//    @State private var isRedirectActive: Bool = false
//    @State private var navigateTo: String? = nil
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            List {
//                SettingsCardView(imageName: "repeat", title: "Total Cycle", detail: "4 Cycle", backgroundColor: .pYellow, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
//                    .listRowInsets(EdgeInsets())
//                    .padding(.bottom, 1)
//                
//                SettingsCardView(imageName: "figure.walk", title: "Walk Duration", detail: "3 Minutes", backgroundColor: .pBlue, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
//                    .listRowInsets(EdgeInsets())
//                    .padding(.bottom, 1)
//                
//                SettingsCardView(imageName: "figure.run", title: "Run Duration", detail: "30 Seconds", backgroundColor: .pGreen, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
//                    .listRowInsets(EdgeInsets())
//                    .padding(.bottom, 1)
//                
//                SaveButtonView()
//            }
//            .listStyle(.carousel)
//            
//        }
//        .navigationBarBackButtonHidden()
//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                CustomBackButton(buttonColor: .pRed)
//            }
//        }
//        .navigationDestination(isPresented: $isRedirectActive) {
//            if navigateTo == "cycle" {
//                CycleSettingsVIew()
//            } 
//            else if navigateTo == "walk" {
//                WalkSettingsView()
//            }
//            else if navigateTo == "run" {
//                RunSettingsView()
//            }
//        }
//        
//        
////        ZStack {
////            NavigationView {
////                VStack(spacing: 0) {
////                    List {
////                        SettingsCardView(imageName: "repeat", title: "Total Cycle", detail: "4 Cycle", backgroundColor: .pYellow, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
////                            .listRowInsets(EdgeInsets())
////                            .padding(.bottom, 1)
////                        
////                        SettingsCardView(imageName: "figure.walk", title: "Walk Duration", detail: "3 Minutes", backgroundColor: .pGreen, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
////                            .listRowInsets(EdgeInsets())
////                            .padding(.bottom, 1)
////                        
////                        SettingsCardView(imageName: "figure.run", title: "Run Duration", detail: "30 Seconds", backgroundColor: .pRed, isRedirectActive: $isRedirectActive, navigateTo: $navigateTo)
////                            .listRowInsets(EdgeInsets())
////                            .padding(.bottom, 1)
////                        
////                        SaveButtonView()
////                    }
////                    .listStyle(.carousel)
////                    
////                }
////                .navigationBarBackButtonHidden()
////                .toolbar {
////                    ToolbarItem(placement: .topBarLeading) {
////                        CustomBackButton(buttonColor: .pRed)
////                    }
////                }
////                .navigationDestination(isPresented: $isRedirectActive) {
////                    if navigateTo == "cycle" {
////                        CycleSettingsVIew()
////                    } 
////                    else if navigateTo == "walk" {
////                        WalkSettingsView()
////                    }
////                    else if navigateTo == "run" {
////                        RunSettingsView()
////                    }
////                }
////            }
////            
////            
////            Image("Grid2")
////                .resizable()
////                .ignoresSafeArea(.all)
////        }
//    }
//}
//
//#Preview {
//    SettingsView()
//}
