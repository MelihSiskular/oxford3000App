//
//  EntranceText.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct EntranceText: View {
    
    @Binding var isTapped: Bool
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var isActive3 = false

    
    var body: some View {
        VStack {
            
            Text("entrance_text_top".localized)
                .font(.custom("AmericanTypewriter", size: 28))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .opacity(isActive1 ? 1 : 0)
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .frame(maxWidth: .infinity,maxHeight: 1)
                .offset(x: isActive3 ? 0:-600)

            Text("entrance_text_bottom".localized)
                .font(.custom("AmericanTypewriter", size: 24))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .opacity(isActive2 ? 1 : 0)

        }
        .opacity(isTapped ? 0:1)
        .onAppear {
            if !isTapped {
                onAppeared()
            }
        }
        .onDisappear {
            disAppeared()
        }

    }
    
    func onAppeared() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.bouncy(duration: 2)) {
                
                isActive1 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.bouncy(duration: 2)) {
                
                isActive2 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.bouncy(duration: 1)) {
                
                isActive3 = true
            }
        }
    }
    func disAppeared() {
        isActive1 = false
        isActive2 = false
        isActive3 = false
    }
}

