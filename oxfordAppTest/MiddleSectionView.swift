//
//  MiddleSectionView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 4.02.2025.
//

import SwiftUI

struct MiddleSectionView: View {
    @Binding var isEnglish : Bool
    @Binding var afterTapped : Bool
    @Binding var currentWordEn : String
    @Binding var currentWordTr : String
    @Binding var isTapped : Bool
    
    var body: some View {
      
            ZStack{
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.white)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                
                
                
                Text(isEnglish ? "EN":"TR")
                    .position(x: 20,y:20)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.heavy)
                    .font(.custom("Copperplate", size: 15))
                
                HStack {
                    Image(systemName: "bolt")
                    //.foregroundStyle(Color.gray.opacity(0.3))
                        .position(x: 20,y:180)
                        .frame(maxWidth: 35)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.yellow.mix(with: .black, by: 0.3))
                    Image(systemName: "exclamationmark.3")
                    //.foregroundStyle(Color.gray.opacity(0.3))
                        .position(y:180)
                        .frame(maxWidth: 20)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.red.mix(with: .black, by: 0.3))
                    Image(systemName: "graduationcap")
                    //.foregroundStyle(Color.gray.opacity(0.3))
                        .position(y:180)
                        .frame(maxWidth: 20)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.green.mix(with: .black, by: 0.3))
                    
                    Spacer()
                    
                    
                    //MARK: Bunlar image değil buton olcak
                    Image(systemName: "microphone")
                    //.foregroundStyle(Color.gray.opacity(0.3))
                        .opacity(afterTapped ? 1 : 0)
                        .position(y:180)
                        .frame(maxWidth: 20)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.pink.mix(with: .black, by: 0.3))
                        .symbolEffect(.bounce)
                    
                    Image(systemName: "speaker.wave.3")
                    //.foregroundStyle(Color.gray.opacity(0.3))
                        .opacity(afterTapped ? 1 : 0)
                        .position(y:180)
                        .frame(maxWidth: 20)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray.mix(with: .black, by: 0.3))
                    
                }
                Text(isEnglish ? currentWordEn:currentWordTr)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.serif)
                    .onTapGesture(count:2) {
                        if currentWordTr != "" {
                            withAnimation {
                                isEnglish.toggle()
                            }
                        }
                    }
            }
            .opacity(isTapped ? 1:0)
            .frame(maxWidth: .infinity,maxHeight: 200)
        }
    }


//#Preview {
//    MiddleSectionView()
//}
