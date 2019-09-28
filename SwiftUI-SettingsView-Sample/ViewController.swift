//
//  ViewController.swift
//  SwiftUI-SettingsView-Sample
//
//  Created by 若林大悟 on 2019/09/27.
//  Copyright © 2019 Rakko Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let settings = UserSettings()
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = settings.colors[settings.colorId].color
        label.text = "Switch: " + settings.switchValue.description
        if settings.useSystemFontSize {
            label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        } else {
            label.font = UIFont.systemFont(ofSize: CGFloat(settings.fontSize))
        }
    }
}

