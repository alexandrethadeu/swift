//
//  Utilities.swift
//  Back to the Future
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/26/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation

class Utilities {
    
    func GetCurrentYear () -> String {
        let date = Date()
        let calendar = Calendar.current
        return String(calendar.component(.year, from: date))
    }
    
    func GetLetterAtIndex (str: String, location: Int) -> String {
        let index = str.index(str.startIndex, offsetBy:location)
        return String(str[index])
    }
    
    func GetCurrentTime() -> String {
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        let timeString = formatter.string(from: date)
        
        return timeString
    }
    
    func GetRandomYear() -> String {
        return String(arc4random_uniform(8999) + 1000)
    }
    
}
