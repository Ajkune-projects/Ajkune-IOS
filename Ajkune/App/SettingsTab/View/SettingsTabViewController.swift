//
//  SettingsTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import UIKit

class SettingsTabViewController: UIViewController, Storyboarded {
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var yourGiftsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    //Properties
    var viewModel: SettingsTabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        localize()
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    
    @objc func updateLang(notification: Notification) {
        localize()
    }
    
    func localize(){
        profileButton.setTitle("profile".localized, for: .normal)
        languageButton.setTitle("language".localized, for: .normal)
        logoutButton.setTitle("log_out".localized, for: .normal)
        yourGiftsButton.setTitle("your_gifs".localized, for: .normal)
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
