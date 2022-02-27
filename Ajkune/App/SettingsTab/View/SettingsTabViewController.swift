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
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var deleteAccount: UIButton!
    
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
        titleButton.setTitle("account".localized, for: .normal)
        deleteAccount.setTitle("deleteAccount".localized, for: .normal)
    }
    
    func deleteUser(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.deleteUser(completion: { (response) in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                self.showAlertWithAction()
            }
            else {
                self.showAlertWith(title: "OUPS !", message: response?.message ?? "ERROR")
            }
        })
    }
    func showAlertWithAction(){
        let alert = UIAlertController(title: "Ajkune", message:"deactivate_account".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "D'accord", style: .default, handler: { (_) in
            Account.shared.initLogin()
            Account.shared.clear()
        }))
        self.present(alert, animated: true)
    }
    func showAlertWithTwoAction(){
        let alert = UIAlertController(title: title, message: "login_premissions".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"yes".localized, style: .default, handler: { (_) in
            Account.shared.clear()
        }))
        alert.addAction(UIAlertAction(title:"no".localized, style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    //IBActions
    @IBAction func showProfileAction(_ sender: Any) {
        if UserDefaults.standard.value(forKey: "USER_TOKEN") as! String == globalData.defaultToken{
            showAlertWithTwoAction()
        }else{
            self.viewModel?.showProfile()
        }
    }
    @IBAction func chooseLanguageAction(_ sender: Any) {
        self.viewModel?.showLanguage()
    }
    @IBAction func logOutAction(_ sender: Any) {
        Account.shared.clear()
    }
    @IBAction func myGiftsAction(_ sender: Any) {
        if UserDefaults.standard.value(forKey: "USER_TOKEN") as! String == globalData.defaultToken{
            showAlertWithTwoAction()
        }else{
            self.viewModel?.showMyGifts()
        }
        
    }
    
    @IBAction func deleteAccountAction(_ sender: Any) {
        if UserDefaults.standard.value(forKey: "USER_TOKEN") as! String == globalData.defaultToken{
            showAlertWithTwoAction()
        }else{
            deleteUser()
        }
    }
    
}
