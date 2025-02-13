//
//  HardButtonScreen.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI
import SwiftData

struct HardButtonScreen: View {
    
    @State private var savedHardTest = [Kelimeler(tr: "isim", en: "name"),
                                    Kelimeler(tr:"merhaba" , en: "hello"),
                                    Kelimeler(tr: "görüşürüz", en: "goodbye"),
                                    Kelimeler(tr: "günaydın", en: "good morning"),
                                        Kelimeler(tr: "isim", en: "name"),
                                        Kelimeler(tr:"merhaba" , en: "hello"),
                                        Kelimeler(tr: "görüşürüz", en: "goodbye"),
                                        Kelimeler(tr: "günaydın", en: "good morning"),
                                        Kelimeler(tr: "isim", en: "name"),
                                        Kelimeler(tr:"merhaba" , en: "hello"),
                                        Kelimeler(tr: "görüşürüz", en: "goodbye"),
                                        Kelimeler(tr: "günaydın", en: "good morning"),
                                    ]
    
    
    
    @State private var isHidden : Bool = false
    @Environment(\.modelContext) var modelContext
   
    @State var leftButton = "Left"
    @State var middleButton = "QUIZ"
    @State var rightButton = "Hide"
    
    @Query  var savedHardData : [ListHardData]
    
    @State var colors : [Color] = [Color]()

    
    var body: some View {
        NavigationStack {
            ZStack {
                ViewBackGround()
                VStack {
                    
                    
                    HStack {
                        Text("hard_words_list".localized)
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                       
                    
                    
                    Spacer()
                    
                    
                    HStack {
                        
                        Button("left_button".localized) {
                            
                        }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .fontWeight(.bold)
                            .font(.title)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.roundedRectangle)
                            .tint(Color.orange.mix(with: .white, by: 0.1))
                            .foregroundStyle(Color.black)
                        
                        
                        Spacer()
                        
                        Button("quiz_button".localized) {
                                
                            }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                                .fontWeight(.bold)
                                .font(.title)
                                .buttonStyle(.borderedProminent)
                                .buttonBorderShape(.roundedRectangle)
                                .tint(Color.orange.mix(with: .white, by: 0.1))
                                .foregroundStyle(Color.black)
                        Spacer()
                        
                        Button(isHidden ? "hide_button_off".localized : "hide_button_on".localized) {
                            withAnimation {
                                isHidden.toggle()
                            }
                        }
                        
                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                        .fontWeight(.bold)
                        .font(.title)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(Color.orange.mix(with: .white, by: 0.1))
                        .foregroundStyle(Color.black)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    List {
                        ForEach(Array(zip(savedHardData,colors)),id: \.0) { (saved,color) in
                                
                                HStack {

                                    Color(color)
                                        .frame(width: 40, height: 40, alignment: .leading)
                                        .cornerRadius(6)
                                    
                                    Text(saved.en)
                                        .font(.headline)
                                        .fontWeight(.black)
                                    Spacer()
                                    Text(saved.tr)
                                        .font(.subheadline)
                                        .offset(x:isHidden ? 10:0)
                                        .opacity(isHidden ? 0:1)
                                    
                                }
                                .listRowSeparatorTint(.cyan)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .padding(.vertical,2)
                                        .padding(.horizontal,5)
                                    
                                )
                                
                                
                                
                                
                            }
                            
                            .frame(height: 40)
                        
                    }
                    .navigationTitle("hard_words_text".localized)
                    .navigationBarTitleDisplayMode(.inline)
                    .listStyle(.plain)
                 
                    Spacer()
                    
                }
                
                  
            }
        }.onAppear() {
            colorsfunc(data: savedHardData, colors: &colors)
        }
    }
}

#Preview {
    HardButtonScreen()
}

func colorsfunc(data: [ListHardData],colors: inout [Color]) {
    
    
    for i in data {
        if i.point < 0 {
            colors.append(Color.black)
        }else if i.point >= 0 && i.point <= 2 {
            colors.append(Color.red)
        }
        else if i.point > 2 && i.point <= 4 {
            colors.append(Color.yellow)
        }
        else if i.point > 4 {
            colors.append(Color(uiColor: .systemGreen))

        }
    }
}
