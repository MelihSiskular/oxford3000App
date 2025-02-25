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
    
    init() {
        ///When the app opened
        getNotificationRequest()
        sendAllArrangedNotifications()
        requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.light) ///always gonna work on light mode
            
        }
        .modelContainer(for: [ListHardData.self,ListFirstData.self]) ///SwiftData @Model
        
        
        
    }
}

