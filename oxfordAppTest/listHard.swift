//
//  listHard.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 2.02.2025.
//

import Foundation
import SwiftData




@Model
class ListHardData {
    var tr: String
    var en: String
    var point: Int
    
    init(tr: String, en: String, point: Int) {
        self.tr = tr
        self.en = en
        self.point = point
    }
}

@Model
class ListFirstDataNew {
    var tr: String
    var en: String
    var point: Int
    var sentence: String
    
    init(tr: String, en: String, point: Int,sentence: String) {
        self.tr = tr
        self.en = en
        self.point = point
        self.sentence = sentence
        
    }
}



enum Difficult {
    case Easy
    case Medium
    case Hard
    
    
}
