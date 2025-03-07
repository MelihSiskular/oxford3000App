//
//  QuizScreen.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 7.03.2025.
//

import SwiftUI

struct QuizScreen: View {
    
    @Environment(\.dismiss) private var dismiss  // Geri gitme işlemi için dismiss'i kullanıyoruz
    
    
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
                    
                    
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            .padding()
                            .frame(height: 200)
                    }
                    
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .frame(maxWidth: .infinity,maxHeight: 1)
                        .padding(.horizontal)
                    
                    
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.horizontal)
                        .frame(height: 60)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.horizontal)
                        .frame(height: 60)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.horizontal)
                        .frame(height: 60)
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.horizontal)
                        .frame(height: 60)
                    
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.orange.mix(with: .white, by: 0.2))
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding()
                        .frame(height: 100)
                    
                    
                    
                    
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
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
    QuizScreen()
}

