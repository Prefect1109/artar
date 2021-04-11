//
//  BaseVC.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Cocoa

class BaseVC: NSViewController {
    
    override func viewDidLoad() {
        configureUI()
    }
    
    private func configureUI() {
        // Setup view
        view.wantsLayer = true
        view.layer?.backgroundColor = Design.Colors.brandColor1.cgColor
    }
}
