//
//  StoriesFile.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 27.02.2025.
//

import Foundation


struct Stories{

    
    
    let storyTitle: String
    let topic: topic
    let popUpText: String
    
    var boolScript : Bool 
    var boolTest: Bool
    var boolWords: Bool
    var storyCompleted: Bool
    
    var pointInTest: Int
    
}

enum topic: String,CaseIterable {
    case travel = "topic_travel"
    case school = "topic_school"
    case work = "topic_work"
    case life = "topic_life"
    case friends = "topic_friends"
}
