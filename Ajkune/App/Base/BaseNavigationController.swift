//
//  BaseNavigationController.swift
//  
//
//  Created by Djellza Rrustemi
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
