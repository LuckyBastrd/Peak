//
//  CustomSymbolView.swift
//  Peak Watch App
//
//  Created by Lucky on 25/05/24.
//

import SwiftUI

struct CustomSymbolView: View {
    
    let buttonColor: Color
    let imageName: String
    
    var body: some View {
        ZStack {
            Circle()
              .frame(width: 36, height: 36)
              .foregroundStyle(buttonColor)
              .opacity(0.17)
            
            Image(systemName: imageName)
                .frame(width: 36, height: 36)
                .foregroundStyle(buttonColor)
                .font(.system(size: 18))
        }
    }
}

#Preview {
    CustomSymbolView(buttonColor: .pRed, imageName: "figure.walk")
}
