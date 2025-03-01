//
//  popUpTextView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 1.03.2025.
//

import SwiftUI

struct popUpTextView: View {
    @Binding var isActive: Bool
    var storyTitle: String
    var popUpText: String
    let action: () -> ()



    
    var body: some View {
        VStack {
            
         
            Text("\nMomo & Bobo - " + storyTitle)
                .padding()
                .bold()
                .italic()
                .font(.title3)
            Text(popUpText)
                .italic()
                .font(.subheadline)
                .padding([.horizontal,.bottom])
            
          
        }
        .fixedSize(horizontal: false, vertical: true)
        .background(.cyan.mix(with: .white, by: 0.5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
      
        
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        close()
                        action()
                    }label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .tint(.black)
                    .padding(.horizontal,25)
                    .padding(.vertical,25)
                }
                Spacer()

            }
         
          
       
        }
        .padding()
        .shadow(radius: 5)
        .frame(height: 200)
        
        
    }
    func close() {
        withAnimation(.spring) {
            
            isActive = false
        }
    
    }
        
    
}


#Preview {
    popUpTextView(isActive: .constant(true), storyTitle: "Ask Direction", popUpText: "Momo & Bobo arrived the city but they dont know any road in there, They need to be confident and ask people who knows this city well", action: {})
}
