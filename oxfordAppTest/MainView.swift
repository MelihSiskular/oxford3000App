//
//  MainView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @StateObject var languageManager = LanguageManager()

    private let languages = [
        ("en", "🇬🇧 English"),
        ("tr", "🇹🇷 Türkçe")
    ]
    
    
    @State var selectedScreen = 1
    @State var showLanguageAlert = false
    
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
                        Label("main_tab_first".localized, systemImage: "bolt")
                    }.tag(0)
                    .badge(savedFirstData.count)
                ContentView()
                    .tabItem {
                        Label("main_tab_main".localized, systemImage: "house")
                    }.tag(1)
                HardButtonScreen()
                    .tabItem {
                        Label("main_tab_hard".localized, systemImage: "exclamationmark.3")
                    }.tag(2)
                    .badge(savedHardData.count)
                
            }
            .id(languageManager.selectedLanguage) ///when variable changed this screen gonna reload again!
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
                            Picker("Dil Seç", selection: $languageManager.selectedLanguage) {
                                ForEach(languages, id: \.0) { lang in
                                    Text(lang.1).tag(lang.0)
                                }
                            }.onChange(of: languageManager.selectedLanguage) { _, _ in
                                showLanguageAlert.toggle()
                             
                            }
                            
                        } label: {
                            Image(systemName: "flag.2.crossed")
                                .accentColor(.black.mix(with: .blue, by: 0.6))
                        }
                        .alert("🌎", isPresented: $showLanguageAlert) {
                            Button("done_button".localized,role:.cancel) {}
                        }message: {
                            Text("language_alert_text".localized)
                        }
                        
                    
              
                }
                
            }
         
        }
        
    }
}

class LanguageManager: ObservableObject {
    @Published var selectedLanguage: String {
        didSet {
            UserDefaults.standard.set(selectedLanguage, forKey: "appLanguage")
            Bundle.setLanguage(selectedLanguage)
        }
    }
    
    init() {
        self.selectedLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? "en"
        Bundle.setLanguage(self.selectedLanguage)
    }
}

private var bundleKey: UInt8 = 0

final class LanguageBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return (objc_getAssociatedObject(self, &bundleKey) as? Bundle ?? Bundle.main).localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    static func setLanguage(_ language: String) {
        let value: AnyClass? = object_getClass(Bundle.main)
        object_setClass(Bundle.main, LanguageBundle.self)
        
        objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}


#Preview {
    MainView()
}
