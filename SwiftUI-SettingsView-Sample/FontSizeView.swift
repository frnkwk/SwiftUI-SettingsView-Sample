//
//  FontSizeView.swift
//  SwiftUI-SettingsView-Sample
//
//  Created by 若林大悟 on 2019/09/28.
//  Copyright © 2019 Rakko Inc. All rights reserved.
//

import SwiftUI

struct FontSizeView: View {
    @ObservedObject var settings = UserSettings()

    var body: some View {
        List {
            if $settings.useSystemFontSize.wrappedValue {
                Section {
                    HStack {
                        Spacer()
                        Text("Stay hungry, stay foolish.")
                            .frame(height:88.0)
                        Spacer()
                    }
                }
            } else {
                Section {
                    HStack {
                        Spacer()
                        Text("Stay hungry, stay foolish.")
                            .font(.system(size: CGFloat($settings.fontSize.wrappedValue)))
                            .frame(height:88.0)
                        Spacer()
                    }
                }
                Section {
                    Stepper("\(Int($settings.fontSize.wrappedValue)) pt", value: $settings.fontSize, in: 9...64)
                }
            }
            Section {
                Toggle(isOn: $settings.useSystemFontSize) {
                    Text("Use System Size")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct FontSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FontSizeView()
    }
}
