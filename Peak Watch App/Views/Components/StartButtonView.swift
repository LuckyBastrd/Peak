//
//  StartButtonView.swift
//  Peak Watch App
//
//  Created by Lucky on 24/05/24.
//

import SwiftUI

struct StartButtonView: View {
    
    @State private var isRedirectActive: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            Button(action: {
                isRedirectActive = true
            }) {
                Text("Start")
                    .frame(maxWidth: .infinity, alignment: .center) 
            }
        }
        .navigationDestination(isPresented: $isRedirectActive) {
            CountDownView()
        }
        
    }
}

#Preview {
    StartButtonView()
}
