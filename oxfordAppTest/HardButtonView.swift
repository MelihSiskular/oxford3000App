//
//  HardButtonView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 4.02.2025.
//

import SwiftUI

struct HardButtonView: View {
    
    @Binding var selectedFirst: Bool
    @Binding var selectedHard: Bool
    @Binding var afterTapped: Bool
    
    var body: some View {
        Button("HARD",systemImage: "exclamationmark.3") {
            
            if !selectedFirst && selectedHard {
                selectedHard = false
                selectedFirst = false
            }else {
                selectedHard = true
                selectedFirst = false
                
            }
            
        }
        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
        .fontWeight(.bold)
        .font(.largeTitle)
        .tint(selectedFirst ? Color.red.opacity(0.4) : Color.red)
        .foregroundStyle(Color.black)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .offset(x: afterTapped ? 0:1000)
    }
    
}

//#Preview {
//    HardButtonView()
//}
