//
//  CustomBackButton.swift
//  Peak Watch App
//
//  Created by Lucky on 22/05/24.
//

import SwiftUI

struct CustomButtonView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var navigateToMainView = false
    
    let buttonColor: Color
    let imageName: String
    
    var body: some View {
        Button(action: {
            if imageName == "xmark" {
                navigateToMainView = true
            } else {
                dismiss()
            } 
        }) {
            ZStack {
                Circle()
                    .frame(width: 36, height: 36)
                    .foregroundStyle(.white)
                    .opacity(0.17)
                
                Image(systemName: imageName)
                    .frame(width: 36, height: 36)
                    .foregroundStyle(buttonColor)
                    .font(.system(size: 18))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .navigationDestination(isPresented: $navigateToMainView) {
            MainView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CustomButtonView(buttonColor: .pRed, imageName: "chevron.backward")
}
