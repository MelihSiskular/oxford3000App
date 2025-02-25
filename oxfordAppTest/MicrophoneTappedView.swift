//
//  MicrophoneTappedView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 19.02.2025.
//

import SwiftUI

struct MicrophoneTappedView: View {
    
 

    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
               
              
            Image(systemName:"microphone")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .symbolEffect(.breathe)
                .foregroundStyle(.cyan.mix(with: .white, by: 0.2))
   
        }
        .ignoresSafeArea()

        
    }
}
///I used .consrant to see Preview
#Preview {
    MicrophoneTappedView()
}




