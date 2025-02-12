//
//  EntranceText.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct EntranceText: View {
    
    @Binding var isTapped: Bool
    
    var body: some View {
        VStack {
            Text("entrance_text_top".localized)
                .font(.custom("AmericanTypewriter", size: 28))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .frame(maxWidth: .infinity,maxHeight: 1)
            Text("entrance_text_bottom".localized)
                .font(.custom("AmericanTypewriter", size: 24))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
        }
        .opacity(isTapped ? 0:1)
        
    }
}

#Preview {
    EntranceText(isTapped: .constant(false))
}
