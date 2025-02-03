//
//  EntranceText.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct EntranceText: View {
    
    @State var isTapped = false
    
    var body: some View {
        VStack {
            Text("Improve Your English Vocab Skill With Using \n\"The Oxford 3000\"")
                .font(.custom("AmericanTypewriter", size: 28))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .frame(maxWidth: .infinity,maxHeight: 1)
            Text("Save the words according to the categories in this way you can beware that your missing") .font(.custom("AmericanTypewriter", size: 24))
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
        }
        .opacity(isTapped ? 0:1)
        
    }
}

#Preview {
    EntranceText()
}
