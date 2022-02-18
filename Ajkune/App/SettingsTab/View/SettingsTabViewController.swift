//
//  SettingsTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import UIKit

class SettingsTabViewController: UIViewController, Storyboarded {
    @IBOutlet weak var profileButton: UIButton!
    
    //Properties
    var viewModel: SettingsTabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        // Do any additional setup after loading the view.
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    
    @objc func updateLang(notification: Notification) {
        profileButton.setTitle("profile".localized, for: .normal)

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
    @IBAction func myGiftsAction(_ sender: Any) {
        self.viewModel?.showMyGifts()
    }
    
}
