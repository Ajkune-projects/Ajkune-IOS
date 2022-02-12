//
//  SettingsTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import UIKit

class SettingsTabViewController: UIViewController, Storyboarded {
    
    //Properties
    var viewModel: SettingsTabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//IBActions
    @IBAction func showProfileAction(_ sender: Any) {
        self.viewModel?.showProfile()
    }
    @IBAction func chooseLanguageAction(_ sender: Any) {
        self.viewModel?.showLanguage()
    }
    @IBAction func logOutAction(_ sender: Any) {
        Account.shared.clear()
    }
    
}
