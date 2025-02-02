//
//  listHard.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 2.02.2025.
//

import Foundation
import SwiftData

@Model
class ListHard {
    var tr : String
    var en : String
    
    init(tr: String, en: String) {
        self.tr = tr
        self.en = en
    }
}
