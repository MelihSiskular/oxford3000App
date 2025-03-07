//
//  QuizFile.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 7.03.2025.
//

import Foundation


protocol Quiz {
    
    
    
}

struct categoryFirstList: Quiz {
    var listFirstDataNewArray :[ListFirstDataNew]
    
    init(listFirstDataNewArray: [ListFirstDataNew]) {
        self.listFirstDataNewArray = listFirstDataNewArray
    }
}

struct categoryHardList: Quiz {
    var listHardDataArray : [ListHardData]
    
    init(listHardDataArray: [ListHardData]) {
        self.listHardDataArray = listHardDataArray
    }
}



