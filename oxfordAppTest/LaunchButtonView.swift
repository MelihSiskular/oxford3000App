//
//  LaunchButtonView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 4.02.2025.
//

import SwiftUI
import SwiftData

struct LaunchButtonView: View {
    
    @Binding var isTapped: Bool
    @Binding var selectedHard: Bool
    @Binding var selectedFirst: Bool
    @Binding var afterTapped: Bool
    @Binding var currentWordEn: String
    @Binding var currentWordTr: String
    @Binding var kelimeler : [Kelimeler]
    @Binding var listOfFırst : [Kelimeler]
    @Binding var listOfHard : [Kelimeler]
    
    @Query  var savedHard : [ListHard]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Button(isTapped ? "Show" : "Start") {
            
            if selectedHard {
                listOfHard.append(Kelimeler(tr: currentWordTr, en: currentWordEn))
                
                modelContext.insert(ListHard(tr: currentWordTr, en: currentWordEn))
                
                do {
                    try modelContext.save() //Save process not working accurately thats why there's a code like that
                } catch { }
                
                print("")
                for i in savedHard {
                    print(i.en)
                }
                
                
            }else if selectedFirst {
                listOfFırst.append(Kelimeler(tr: currentWordTr, en: currentWordEn))
            }
            
            
            
            selectedHard = false
            selectedFirst = false
            
            withAnimation {
                if isTapped {
                    afterTapped = true
                }
                isTapped = true
                
            }
            
            if kelimeler.isEmpty {
                if let words : [Kelimeler] = Functionss.loadWords() {
                    kelimeler = words //3846 kelime
                    //print("Başla")
                    
                    for word in kelimeler {
                        var index = 0
                        for firsIndex in Dizi.alfabe {
                            if (word.en.first?.description == firsIndex) {
                                //print(word.en.first ?? "")
                                Dizi.ayrilmis[firsIndex]
                            }
                        }
                    }
                    
                } else {
                    print("Kelimeler yüklenemedi.")
                    print(Dizi.ayrilmis)
                }
            }else {
                let randomSayi = Int.random(in: 0...(kelimeler.count - 1))
                //Functionss.show(kelimeler,randomSayi)
                withAnimation(.snappy) {
                    currentWordEn = Functionss.returnWord(kelimeler, randomSayi).en
                    currentWordTr = Functionss.returnWord(kelimeler, randomSayi).tr
                }
            }
        }
        .tint(.white)
        .buttonStyle(.borderedProminent)
        .foregroundStyle(.cyan.mix(with: .black, by: 0.3))
        .fontWeight(.bold)
        .padding()
    }
}

//#Preview {
//    LaunchButtonView()
//}
