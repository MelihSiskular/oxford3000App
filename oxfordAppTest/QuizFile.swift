//
//  QuizFile.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 7.03.2025.
//

import Foundation


protocol Quiz {
    
    
    
}

class categoryFirstList: Quiz {
    var listFirstDataNewArray :[ListFirstDataNew]
    
    init(listFirstDataNewArray: [ListFirstDataNew]) {
        self.listFirstDataNewArray = listFirstDataNewArray
    }
}

class categoryHardList: Quiz {
    var listHardDataArray : [ListHardData]
    
    init(listHardDataArray: [ListHardData]) {
        self.listHardDataArray = listHardDataArray
    }
}



