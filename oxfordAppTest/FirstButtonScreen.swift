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
    @Query  var savedFirstData : [ListFirstDataNew]
    
    @State var savedFirst = [
        Kelimeler(tr: "merhaba", en: "hello"),
        Kelimeler(tr: "görüşürüz", en: "see you"),
        Kelimeler(tr: "merhaba", en: "hellu"),
        Kelimeler(tr: "görüşürüz", en: "see yuu")

    ]

    

    
    @State private var textFieldValue = ""
    @State private var isHidden : Bool = false
    @State private var isActive = false
    @State private var isTappedLeftButton = false
    @State var isTappedTextField = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ViewBackGround()
                
                VStack {
                    
                    HStack {
                        Text("first_words_list".localized)
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button("left_button".localized) {
                            leftButton()
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
                    
                    List {
                        ForEach(savedFirstData,id:\.en) { saved in
                            
                            
                            HStack {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                        .foregroundStyle(.orange)
                                        .frame(width: 50, height: 50, alignment: .leading)
                                        .onTapGesture {
                                            isTappedTextField = true
                                            
                                            
                                            
                                            
                                            //CustomPopUp for textfield!
                                            
                                            
                                            //we will update datas like that 
                                            do {
                                                try modelContext.save() //Save process not working accurately thats why there's a code like that
                                            } catch { }
                                            
                                            
                                            
                                            
                                        }
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .frame(width: 33, height: 33, alignment: .leading)
                                }
                                .offset(x : isTappedLeftButton ? -10 : -20)
                                .opacity(isTappedLeftButton ? 1 : 0)
                                
                                
                                VStack(alignment:.leading) {
                                    Spacer()
                                    
                                    Text(saved.en)
                                        .fontWeight(.black)
                                        .font(.system(size: isTappedLeftButton ?  22:26))
                                        .fontWidth(.condensed)
                                        
                                 
                                    if saved.sentence != ""{
                                        Text(saved.sentence)
                                            .font(.caption)
                                            .opacity(isTappedLeftButton ? 1 : 0)
                                    }else {
                                        Text("Cümle Girişi Yapılmadı.")
                                            .font(.caption)
                                            .opacity(isTappedLeftButton ? 1 : 0)
                                    }
                             
                                
                                }.padding(.vertical)
                                    .offset(x: isTappedLeftButton ? 0 : -70)
                                
                                
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
                        
                        .listRowSeparator(.hidden)
                        .frame(height: 50)
                    }
                    .offset(x:isActive ? 0 : -600)
                    .opacity(isActive ?  1 : 0)
                }
            }
            .navigationTitle("first_words_text".localized)
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            
            Spacer()
        }
        .onAppear {
            onAppeared()
        }.onDisappear {
            disAppeared()
        }
        
        
      
    }
    func onAppeared() {
        withAnimation(.smooth(duration: 1).speed(2)) {
            isActive = true
        }
    }
    func disAppeared() {
        isActive = false
    }
    func leftButton() {
        withAnimation(.bouncy) {
            isTappedLeftButton.toggle()
            
        }
    }
}

#Preview {
    FirstButtonScreen()
}
