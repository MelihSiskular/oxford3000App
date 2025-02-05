//
//  FirstButtonView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 4.02.2025.
//

import SwiftUI

struct FirstButtonView: View {
    
    @Binding var selectedFirst: Bool
    @Binding var selectedHard: Bool
    @Binding var afterTapped: Bool


    
    var body: some View {
        Button("FIRST", systemImage: "bolt") {
            
            if selectedFirst && !selectedHard {
                selectedHard = false
                selectedFirst = false
            }else {
                selectedHard = false
                selectedFirst = true
            }
            
        }
        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
        .fontWeight(.bold)
        .font(.largeTitle)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .tint(selectedHard ? Color.orange.opacity(0.4) : Color.orange)
        .foregroundStyle(Color.black)
        .offset(x: afterTapped ? 0:-1000)
    }
}

//#Preview {
//    FirstButtonView()
//}
