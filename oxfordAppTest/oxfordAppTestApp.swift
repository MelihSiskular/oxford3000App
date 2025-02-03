//
//  oxfordAppTestApp.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 31.01.2025.
//

import SwiftUI
import SwiftData

@main
struct oxfordAppTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: ListHard.self)
        
        
        
    }
}
