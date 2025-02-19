//
//  LocalNotificationFile.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 10.02.2025.
//

import Foundation
import UserNotifications
import SwiftData
import SwiftUICore

func getNotificationRequest() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert,.sound,.badge]) { granted, error in
        if granted {
            print("successful")
        }else {
            print("nil")
        }
    }
    
}

func arrangeScheduledNotifications(hour:Int, min:Int,id:String,title:String,body:String) {
    
    let center = UNUserNotificationCenter.current()
    
    let content = UNMutableNotificationContent()
    
    content.title = title
    content.body = body
    content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "NotificationSound.wav"))
    
    var dateComponent = DateComponents()
    dateComponent.hour = hour
    dateComponent.minute = min
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
    
    let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
    
    center.add(request) { error in
        if let error = error {
            print(error.localizedDescription)
        }
        
    }
}


func sendAllArrangedNotifications() {
    arrangeScheduledNotifications(hour: 8, min: 30, id: "morningN",title: "The Oxford 3000",body: "notification-2".localized)
    arrangeScheduledNotifications(hour: 12, min: 30, id: "lunchN",title: "The Oxford 3000",body: "notification-1".localized)
    arrangeScheduledNotifications(hour: 16, min: 30, id: "afternoonN",title: "The Oxford 3000",body: "notification-3".localized)
    arrangeScheduledNotifications(hour: 18, min: 30, id: "freetimeN",title: "The Oxford 3000",body: "notification-1".localized)
    arrangeScheduledNotifications(hour: 20, min: 30, id: "eveningN",title: "The Oxford 3000",body: "notification-4".localized)
    arrangeScheduledNotifications(hour: 22, min: 30, id: "nightN",title: "The Oxford 3000",body: "notification-1".localized)
}

