//
//  Settings.swift
//  SwiftUI-SettingsView-Sample
//
//  Created by 若林大悟 on 2019/09/28.
//  Copyright © 2019 Rakko Inc. All rights reserved.
//

import Foundation
import Combine
import UIKit

final class UserSettings: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @UserDefault("switch", defaultValue: false)
    var switchValue: Bool
    
    @UserDefault("useSystemFontSize", defaultValue: true)
    var useSystemFontSize: Bool
    
    @UserDefault("fontSize", defaultValue: 17.0)
    var fontSize: Double
    
    @UserDefault("backgroundColor", defaultValue: 0)
    var colorId: Int
    
    let colors = [ColorSetting(id: 0, name: "System Background", color: UIColor.systemBackground),ColorSetting(id: 1, name: "System Red", color: UIColor.systemRed),ColorSetting(id: 2, name: "System Green", color: UIColor.systemGreen),ColorSetting(id: 3, name: "System Yellow", color: UIColor.systemYellow),ColorSetting(id: 4, name: "System Indigo", color: UIColor.systemIndigo)]
    
    private var notificationSubscription: AnyCancellable?

    init() {
        notificationSubscription = NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification).sink { _ in
            self.objectWillChange.send()
        }
    }
}

struct ColorSetting:Identifiable {
    var id: Int
    var name:String
    var color:UIColor
}
