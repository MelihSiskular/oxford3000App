//
//  popUpTextFieldView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 2.03.2025.
//

import SwiftUI

struct popUpTextFieldView: View {
    
    //MARK: NEEDS FIX!
    
    @Binding var isActive : Bool
    @Binding var textFieldText : String
    let wordEn : String
    let action: () -> ()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Make a sentence about " )
                    
                    .fontWeight(.bold)
                    .italic()
                    .foregroundStyle(.white)
                    
                Text(wordEn).underline()
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    
            }
            .font(.system(size: 18))
            .padding(.top)
            TextField("Enter...", text: $textFieldText)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Save") {
                action()
                textFieldText = ""
            }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                .fontWeight(.bold)
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .tint(.orange.mix(with: .white, by: 0.5))
                .foregroundStyle(Color.black)
                .padding()
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(.orange.mix(with: .white, by: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .offset(x: isActive ? 0 : -600)
    }
        
}

#Preview {
    popUpTextFieldView(isActive: .constant(true), textFieldText: .constant(""), wordEn: "hello", action: {})
}
