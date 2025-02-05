//
//  MainView.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 3.02.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @State var selectedScreen = 1
    
    @Environment(\.modelContext) var modelContext
    @Query  var savedHard : [ListHard]
    
    
    
    //@Environment(\.dismiss) var dismiss
    @State private var showInfoSheet = false
    
    var body: some View {
        NavigationStack {
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
                    .badge(savedHard.count)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //To do
                        showInfoSheet.toggle()
                    } label: {
                        Image(systemName: "info.bubble")
                            .accentColor(.black.mix(with: .blue, by: 0.6))
                    }
                    .sheet(isPresented: $showInfoSheet) {
                        ///Show new screen
                        InfoView()
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    MainView()
}
