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
    @IBOutlet weak var descriptionLabel: UILabel!
    //MARK: - Properties
    var viewModel: TDInitialScreenViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Functions
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.viewModel?.initializeLogin()
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
         self.viewModel?.showSignUp()
    }
}
