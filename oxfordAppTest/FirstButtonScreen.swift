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
        ListFirstDataNew(tr: "merhaba", en: "hello",point: 0,sentence: ""),
        ListFirstDataNew(tr: "görüşürüz", en: "see you",point: 0,sentence: ""),
        ListFirstDataNew(tr: "naber", en: "What's up",point: 0,sentence: ""),
        ListFirstDataNew(tr: "güzel", en: "beautiful",point: 0,sentence: "")

    ]

    

    //Text Field out of context
    @State private var titleFromList = ""
    @State private var indexFromList = 0
    
    
    
    
    
    
    @State private var isShowQuizScreen = false
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
                        
                     
                       
                        VStack {
                            Button("quiz_button".localized) {
                                // Butona tıklayınca geçişi tetikle
                                isShowQuizScreen = true
                            }
                            .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                            .fontWeight(.bold)
                            .font(.title)
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.roundedRectangle)
                            .tint(Color.orange.mix(with: .white, by: 0.1))
                            .foregroundStyle(Color.black)
                            .navigationDestination(isPresented: $isShowQuizScreen) {
                                QuizScreen().navigationBarBackButtonHidden()
                            }
                            
                      
                        }
                        
                        
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
                    
                    ZStack {
                        List {
                            ForEach(Array(savedFirstData.enumerated()),id:\.0) { index, saved in
                                
                                
                                HStack {
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 6)
                                            .foregroundStyle(.orange)
                                            .frame(width: 50, height: 50, alignment: .leading)
                                            .onTapGesture {
                                                withAnimation {
                                                    isTappedTextField.toggle()
                                                    if isTappedTextField {
                                                        indexFromList = index
                                                      
                                                    }
                                                }
                                                
                                               
                                                titleFromList = saved.en
                                                ///(savedFirst.indices)
                                                //CustomPopUp for textfield!
                                             
                                                
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
                                            .fixedSize(horizontal: true,vertical: false)
                                            
                                        
                                        
                                        if saved.sentence != ""{
                                            Text(saved.sentence)
                                                .font(.caption)
                                                .opacity(isTappedLeftButton ? 1 : 0)
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)

                                            
                                                
                                                
                                        }else {
                                            Text("sentence_nil".localized)
                                                .font(.caption)
                                                .opacity(isTappedLeftButton ? 1 : 0)
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)



                                        }
                                        
                                        
                                    }.padding(.vertical)
                                        .offset(x: isTappedLeftButton ? 0 : -70)
                                        
                                    
                                    
                                    
                                    Spacer()
                                    
                                    
                                   
                                    
                                    Text(saved.tr)
                                        .font(.subheadline)
                                        .offset(x:isHidden ? 10:0)
                                        .opacity(isHidden ? 0:1)
                                        .multilineTextAlignment(.trailing)
                                        .fixedSize(horizontal: true, vertical: false)

                                    
                                        
                         

                                    
                                    
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
                   
                        
                        popUpTextFieldView(index: $indexFromList,isActive: $isTappedTextField, textFieldText: $textFieldValue, wordEn: $titleFromList, action: {})
                            .opacity(isTappedTextField ? 1:0)
                            .offset(y:isTappedTextField ? 0 : 800)
                        
                    }
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
    func saveTextField() {
        
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
