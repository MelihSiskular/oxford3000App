//
//  json.swift
//  oxfordAppTest
//
//  Created by Melih Şişkular on 31.01.2025.
//

import Foundation
import AVFoundation
import SwiftUICore

struct Kelimeler : Codable {
    let tr: String
    let en: String
}



struct Dizi {
    static let alfabe = [
        "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","r","s","t","u","v","y","z"
    ]
    static var ayrilmis : [String : [String]] = Dictionary()
}

struct Functionss {
    
    static func loadWords() -> [Kelimeler]? {
        // JSON dosyasının yolu
        if let path = Bundle.main.path(forResource: "oxford_3000", ofType: "json") {
            do {
                // JSON dosyasını yükle
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                // JSON'u çöz
                let words = try JSONDecoder().decode([Kelimeler].self, from: data)
                return words
            } catch {
                // Hata mesajı
                print("JSON verileri okunamadı: \(error)")
            }
        }
        return nil
    }
    
    static func show(_ dizi:[Kelimeler],_ random:Int)  {
        print("\(dizi[random].tr) = \(dizi[random].en)")
    }
    static func returnWord(_ dizi:[Kelimeler],_ random:Int) -> Kelimeler {
        return dizi[random]
    }
}

extension Bundle {
    private static var bundle: Bundle!
    
    static func setLanguage(_ language: String) {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else { return }
        bundle = Bundle(path: path)
    }
    
    static func localizedString(forKey key: String) -> String {
        return bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}





