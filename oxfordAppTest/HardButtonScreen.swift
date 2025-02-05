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
    @Query  var savedHard : [ListHard]
    

    
    var body: some View {
        NavigationStack {
            ZStack {
                ViewBackGround()
                VStack {
                    
                    
                    HStack {
                        Text("Hard Words List")
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                       
                    
                    
                    Spacer()
                    
                    HStack {
                        
                        Button("Left") {
                            
                        }
                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(Color.orange.mix(with: .white, by: 0.1))
                        .foregroundStyle(Color.black)
                        
                        Spacer()
                        
                        Button("QUIZ") {
                            
                        }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.roundedRectangle)
                            .tint(Color.orange.mix(with: .white, by: 0.1))
                            .foregroundStyle(Color.black)
                        Spacer()
                        
                        Button(isHidden ? "Show" : "Hide") {
                            withAnimation {
                                isHidden.toggle()
                            }
                        }
                        .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(Color.orange.mix(with: .white, by: 0.1))
                        .foregroundStyle(Color.black)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    List {
                        ForEach(savedHard,id: \.en) { saved in
                            
                            
                            
                            HStack {
                                
                                Color(Color(uiColor: .red))
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
                    .navigationTitle("Hard Words")
                    .navigationBarTitleDisplayMode(.inline)
                    .listStyle(.plain)
                 
                    Spacer()
                    
                }
                
                  
            }
        }
    }
}

#Preview {
    HardButtonScreen()
}
