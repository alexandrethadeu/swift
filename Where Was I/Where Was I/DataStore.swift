//
//  DataStore.swift
//  Where Was I
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/30/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation

struct  StorageKeys {
    
    
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStore {
    func GetDefaults () -> UserDefaults {
        return UserDefaults.standard
    }
    
    
    func StoreDataPoint (latitude: String, longitude: String) {
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize()
        print(latitude + " : " + longitude)
    }
    
    func GetLastLocation () -> VisitedPoint? {
        let def = GetDefaults()
        
        if let lat = def.string(forKey: StorageKeys.storedLat) {
            if let long = def.string(forKey: StorageKeys.storedLong) {
                return VisitedPoint(lat: lat, long: long)
            }
        }
        return nil
    }
}


