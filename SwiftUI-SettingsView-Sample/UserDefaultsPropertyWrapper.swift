//
//  UserDefaultsPropertyWrapper.swift
//  SwiftUI-SettingsView-Sample
//
//  Created by 若林大悟 on 2019/09/28.
//  Copyright © 2019 Rakko Inc. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key:String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
