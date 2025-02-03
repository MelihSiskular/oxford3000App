//
//  MainView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedScreen = 1
   
    
    
    var body: some View {
        TabView(selection: $selectedScreen) {
            
            FirstButtonScreen()
                .tabItem {
                    Label("First", systemImage: "bolt")
                }.tag(0)
            ContentView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }.tag(1)
            HardButtonScreen()
                .tabItem {
                    Label("Hard", systemImage: "exclamationmark.3")
                }.tag(2)
                .badge(2)
            
            
            
        }
    }
}

#Preview {
    MainView()
}
