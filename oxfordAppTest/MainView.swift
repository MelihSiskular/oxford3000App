//
//  MainView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"

    private let languages = [
        ("en", "🇬🇧 English"),
        ("tr", "🇹🇷 Türkçe")
    ]
    
    
    @State var selectedScreen = 1
    
    @Environment(\.modelContext) var modelContext
    @Query  var savedFirstData : [ListFirstData]
    @Query  var savedHardData : [ListHardData]
    
    
    
    //@Environment(\.dismiss) var dismiss
    @State private var showInfoSheet = false
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedScreen) {
                
                FirstButtonScreen()
                    .tabItem {
                        Label("main_tab_first", systemImage: "bolt")
                    }.tag(0)
                    .badge(savedFirstData.count)
                ContentView()
                    .tabItem {
                        Label("main_tab_main", systemImage: "house")
                    }.tag(1)
                HardButtonScreen()
                    .tabItem {
                        Label("main_tab_hard".localized, systemImage: "exclamationmark.3")
                    }.tag(2)
                    .badge(savedHardData.count)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //To do
                        showInfoSheet.toggle()
                    } label: {
                        ZStack {
                    
                            Image(systemName: "info.bubble")
                                .accentColor(.black.mix(with: .blue, by: 0.6))
                            
                        }
                    }
                    .sheet(isPresented: $showInfoSheet) {
                        ///Show new screen
                        InfoView()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    
                  
                        Menu {
                            Picker("Dil Seç", selection: $selectedLanguage) {
                                ForEach(languages, id: \.0) { lang in
                                    Text(lang.1).tag(lang.0)
                                }
                            }
                            .onChange(of: selectedLanguage) { oldValue, newValue in
                                Bundle.setLanguage(newValue)
                                print(newValue)
                            }
                        } label: {
                            Image(systemName: "flag.2.crossed")
                                .accentColor(.black.mix(with: .blue, by: 0.6))
                               
                               
                        }
                    
              
                }
                
            }
         
        }
        
    }
}

#Preview {
    MainView()
}
