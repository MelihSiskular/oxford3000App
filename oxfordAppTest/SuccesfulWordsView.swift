//
//  SuccesfulWordsView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 27.02.2025.
//

import SwiftUI

struct SuccesfulWordsView: View {
    @State var isActive = false
 
    
    @State private var text1 = false
    @State private var text2 = false
    @State private var text3 = false

    
    var body: some View {
        
       
        
        ZStack {
            
            ViewBackGround()
            
            VStack {
                
                    Image(systemName: "graduationcap.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                      
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .frame(maxWidth: 200,maxHeight: 1)
                        .offset(x: isActive ? 0 : -400)
                        
                    Text("Make mistakes and come into the words you haven't heard before...")
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .italic()
                        .opacity(text1 ? 1 : 0)
                        
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .frame(maxWidth: 280,maxHeight: 1)
                        .offset(x: isActive ? 0: 400)
                
                    Text("One of the best way of learning.\nSo Let's Start!")
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .italic()
                        .opacity(text2 ? 1 : 0)

                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .frame(maxWidth: 200,maxHeight: 1)
                        .offset(x: isActive ? 0 : -400)
                
                    Text("You will be able to see your words only if you had Quizes succesfully...")
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .italic()
                        .opacity(text3 ? 1 : 0)

            }
            .padding(.horizontal)
        }.onAppear() {
            onAppeared()
        }
        .onDisappear() {
            disAppeared()
        }
    }
    
    func onAppeared() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.bouncy(duration: 2)) {
                isActive = true
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.bouncy(duration: 2)) {
                
                text1 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.bouncy(duration: 2)) {
                text2 = true
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.bouncy(duration: 2)) {
                text3 = true
            }
        }
    }
    func disAppeared() {
        isActive = false
        text1 = false
        text2 = false
        text3 = false
    }
}


#Preview {
    SuccesfulWordsView()
}
