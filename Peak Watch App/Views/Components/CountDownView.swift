//
//  CountDownView.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import SwiftUI
import WatchKit

struct CountDownView: View {
    
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    @State var lottieFile: String = "CountDown"
    @State private var navigateToDetail = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: viewModel.image)
                .onAppear {                    
                    self.viewModel.loadAnimationFromFile(filename: lottieFile)
                    
                    viewModel.onAnimationFinish = {
                        navigateToDetail = true
                        WKInterfaceDevice.current().play(.start)
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .padding(.bottom, 23)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomSymbolView(buttonColor: .clear, imageName:"figure")
            }
        }
        .navigationDestination(isPresented: $navigateToDetail) {
            DetailView()
        }
        
    }
}

#Preview {
    CountDownView()
}
