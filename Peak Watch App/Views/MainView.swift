//
//  MainView.swift
//  Peak Watch App
//
//  Created by Lucky on 20/05/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(destination: CountDownView().navigationBarBackButtonHidden()) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(red: 1, green: 0.23, blue: 0.19), location: 0.25),
                                    .init(color: Color(red: 0.6, green: 0.14, blue: 0.11), location: 1.00),
                                ]),
                                startPoint: UnitPoint(x: 0.21, y: 0.1),
                                endPoint: UnitPoint(x: 0.78, y: 0.89)
                            )
                        )
                        .frame(width: 172, height: 172)
                    
                    Text("START")
                        .font(.system(size: 33))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                .padding(.top, 10)
                //.padding(.bottom, 32)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                NavigationLink(destination: UserSettingsView()) {
                    ZStack {
                        Circle()
                            .frame(width: 36, height: 36)
                            .foregroundStyle(.white)
                            .opacity(0.14)
                        
                        Image(systemName: "gearshape")
                            .frame(width: 36, height: 36)
                            .foregroundStyle(.pRed)
                            .font(.system(size: 18))
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        
//        ZStack {            
//            NavigationStack {
//                VStack(spacing: 0) {
//                    NavigationLink(destination: DetailView()) {
//                        ZStack {
//                            Circle()
//                                .fill(
//                                    LinearGradient(
//                                        gradient: Gradient(stops: [
//                                            .init(color: Color(red: 1, green: 0.23, blue: 0.19), location: 0.25),
//                                            .init(color: Color(red: 0.6, green: 0.14, blue: 0.11), location: 1.00),
//                                        ]),
//                                        startPoint: UnitPoint(x: 0.21, y: 0.1),
//                                        endPoint: UnitPoint(x: 0.78, y: 0.89)
//                                    )
//                                )
//                                .frame(width: 172, height: 172)
//                            
//                            Text("START")
//                                .font(.system(size: 33))
//                                .fontWeight(.bold)
//                                .foregroundStyle(.white)
//                        }
//                        .padding(.top, 10)
//                        //.padding(.bottom, 32)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//                .toolbar {
//                    ToolbarItemGroup(placement: .bottomBar) {
//                        Spacer()
//                        NavigationLink(destination: SettingsView()) {
//                            ZStack {
//                                Circle()
//                                    .frame(width: 36, height: 36)
//                                    .foregroundStyle(.white)
//                                    .opacity(0.14)
//                                
//                                Image(systemName: "gearshape")
//                                    .foregroundStyle(.pRed)
//                                    .font(.system(size: 18))
//                            }
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//            
//            Image("Layout3")
//                .resizable()
//                .ignoresSafeArea(.all)
//        }
    }
}

#Preview {
    MainView()
}
