//
//  ContentView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 31.01.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var savedHard : [ListHard]
    
    @State var kelimeler : [Kelimeler] = []
    
    @State var currentWordEn = "English Word"
    @State var currentWordTr = ""
    
    @State var listOfFırst = [Kelimeler]()
    @State var listOfHard = [Kelimeler]()
    
    @State var isTapped = false
    @State var afterTapped = false
    @State var isEnglish = true
    
    @State var selectedFirst = false
    @State var selectedHard = false
    @State var reverse = false

    var body: some View {
        ZStack(alignment: .top) {
    
            
            LinearGradient(gradient: Gradient(colors: [.cyan.mix(with: .white, by: 0.2),.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            
            VStack {
                
                Text("The Oxford 3000")
                    .font(.custom("Thonburi Bold", size: 40, relativeTo: .footnote))
                    .padding(.top,30)
                    .shadow(radius: 4)

                
                    
                

                Spacer()
                
                Button(isTapped ? "Show" : "Start") {
                    
                    if selectedHard {
                        listOfHard.append(Kelimeler(tr: currentWordTr, en: currentWordEn))
                        
                        modelContext.insert(ListHard(tr: currentWordTr, en: currentWordEn))
                        do {
                            try modelContext.save()
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
                
                ZStack {
                    VStack {
                        Text("Improve Your English Vocab Skill With Using \n\"The Oxford 3000\"")
                            .font(.custom("AmericanTypewriter", size: 28))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        RoundedRectangle(cornerRadius: 0, style: .continuous)
                            .frame(maxWidth: .infinity,maxHeight: 1)
                        Text("Save the words according to the categories in this way you can beware that your missing") .font(.custom("AmericanTypewriter", size: 24))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            
                    }
                    .opacity(isTapped ? 0:1)

                   
                    
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
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("FIRST", systemImage: "bolt") {
                        
                        if selectedFirst && !selectedHard {
                            selectedHard = false
                            selectedFirst = false
                        }else {
                            selectedHard = false
                            selectedFirst = true
                        }
                      
                
                      
                     
                        
                       

                    }
                    .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .tint(selectedHard ? Color.orange.opacity(0.4) : Color.orange)
                    .foregroundStyle(Color.black)
                    .offset(x: afterTapped ? 0:-1000)
                    
                    Spacer()
                    
                    Button("HARD",systemImage: "exclamationmark.3") {
                        
                        if !selectedFirst && selectedHard {
                            selectedHard = false
                            selectedFirst = false
                        }else {
                            selectedHard = true
                            selectedFirst = false
                            
                        }
                      
                       
                    }
                    .shadow(color: .black, radius: 0.5, x: 0.5, y: 0.5)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .tint(selectedFirst ? Color.red.opacity(0.4) : Color.red)
                    .foregroundStyle(Color.black)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .offset(x: afterTapped ? 0:1000)
                    
                    
                    Spacer()
                    
                    
                }
                
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            //.background(.cyan.mix(with: .white, by: 0.4))
            
       
        }
        
        
    }
    

}

#Preview {
    ContentView()
}
