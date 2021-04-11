//
//  MovieDetailedVC.swift
//  artar
//
//  Created by Prefect on 11.04.2021.
//

import Foundation
import AppKit

class MovieDetailedVC: BaseVC {
    
    @IBOutlet weak var goBackButton: NSButton!
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
    
    }
    
    //MARK: - On-click methods
    
    @IBAction func goBackButtonPressed(_ sender: NSButton) {
        self.dismiss(self)
    }
    
}
