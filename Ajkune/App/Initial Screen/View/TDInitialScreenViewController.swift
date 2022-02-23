//
//  TDInitialScreenViewController.swift

//
//  Created by Djellza Rrustemi
//

import UIKit

class TDInitialScreenViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    //MARK: - Properties
    var viewModel: TDInitialScreenViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        addObservers()
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    
    @objc func updateLang(notification: Notification) {
        localize()
    }
    //MARK: - Functions
    func localize(){
        loginBtn.setTitle("login".localized.uppercased(), for: .normal)
        signUpBtn.setTitle("register".localized.uppercased(), for: .normal)
        descriptionLabel.text = "initialScreenDesc".localized
        titleLabel.text = "initialScreenTitle".localized
    }
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.viewModel?.initializeLogin()
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
         self.viewModel?.showSignUp()
    }
}
