//
//  QuizScreen.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 7.03.2025.
//

import SwiftUI

struct QuizScreen: View {
    
    @Environment(\.dismiss) private var dismiss  // Geri gitme işlemi için dismiss'i kullanıyoruz
    var dizi : [Quiz] 
    @State private var currenctQuestion = 0
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ViewBackGround()
                
                VStack {
                    
                   
                    
                    
                    HStack {
                        Text("QUIZ")
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    Text("Question " + currenctQuestion.description + " in " + dizi.count.description)
                        .font(.largeTitle)
                        .bold()
                        .fontWidth(.condensed)
                    
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .padding([.horizontal,.bottom])
                            .frame(height: 160)
                    }
                    
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .frame(maxWidth: .infinity,maxHeight: 1)
                        .padding(.horizontal)
                    
                    
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .cyan.mix(with: .white, by: 0.5), radius: 2, x: 3, y: 7)
                        .padding(.horizontal)
                        .frame(height: 50)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .cyan.mix(with: .white, by: 0.5), radius: 2, x: 3, y: 7)
                        .padding(.horizontal)
                        .frame(height: 50)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .cyan.mix(with: .white, by: 0.5), radius: 2, x: 3, y: 7)
                        .padding(.horizontal)
                        .frame(height: 50)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .cyan.mix(with: .white, by: 0.5), radius: 2, x: 3, y: 7)
                        .padding(.horizontal)
                        .frame(height: 50)
                    
                    Button("Complete") {
                        
                    }   .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                        .fontWeight(.bold)
                        .font(.title)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        .tint(Color.orange.mix(with: .white, by: 0.1))
                        .foregroundStyle(Color.black)
                        .padding()
                    
                    
                    
                    
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                        print(dizi[0])
                        
                       
                    }) {
                        Text("Çıkış Yap")
                            .bold()
                            .accentColor(.black.mix(with: .blue, by: 0.6))

                    }
                }
            }
          
        }
        
    }
}

#Preview {
    QuizScreen(dizi: [] )
}

