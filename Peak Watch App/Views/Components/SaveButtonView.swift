//
//  SaveButtonView.swift
//  Peak Watch App
//
//  Created by Lucky on 20/05/24.
//

import SwiftUI

struct SaveButtonView: View {
    
    @ObservedObject var viewModel = UserSettingsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var totalCycle: Int
    var walkDuration: Int
    var runDuration: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                //self.viewModel.saveSettings(totalCycle: self.totalCycle, walkDuration: self.walkDuration, runDuration: self.runDuration)
                
                dismiss()
            }) {
                Text("Save Settings")
                    .frame(maxWidth: .infinity, alignment: .center) 
            }
        }
    }
}
