//
//  FirstButtonScreen.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI
import SwiftData

struct FirstButtonScreen: View {
    
    @Environment(\.modelContext) var modelContext
    @Query  var savedFirstData : [ListFirstData]
    
    @State var privateList = [
        Kelimeler(tr: "merhaba", en: "hello"),
        Kelimeler(tr: "görüşürüz", en: "see you")

    ]
    
    @State private var isHidden : Bool = false


    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ViewBackGround()
                
                VStack {
                    
                    HStack {
                        Text("First Words List")
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button("Left") {
                            
                        }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .fontWeight(.bold)
                            .font(.title)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.roundedRectangle)
                            .tint(Color.orange.mix(with: .white, by: 0.1))
                            .foregroundStyle(Color.black)
                        
                        Spacer()
                        
                        Button("QUIZ") {
                            
                        }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .fontWeight(.bold)
                            .font(.title)
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
                        .font(.title)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(Color.orange.mix(with: .white, by: 0.1))
                        .foregroundStyle(Color.black)
                        
                    }
                    .padding()
                    
                    List {
                        ForEach(savedFirstData) { saved in
                            
                            HStack {
                                Text(saved.en)
                                    .font(.headline)
                                    .fontWeight(.black)
                                
                                Spacer()
                                
                                Text(saved.tr)
                                    .font(.subheadline)
                                    .offset(x:isHidden ? 10:0)
                                    .opacity(isHidden ? 0:1)
                                
                                
                            }.padding()
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .padding(.vertical,2)
                                        .padding(.horizontal,5)
                                    
                                )

                            
                        }
                        .frame(height: 40)


                    }

                    
                }
                
               
        
                
            }
            .navigationTitle("First Words")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            
            Spacer()
        }
      
    }
}

#Preview {
    FirstButtonScreen()
}
