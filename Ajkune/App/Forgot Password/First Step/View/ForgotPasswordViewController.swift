//
//  ForgotPasswordViewController.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
class ForgotPasswordViewController: UIViewController, Storyboarded {
//MARK:IBOutlets
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
//MARK:Properties
    var coordinator: ForgotPasswordCoordinator?
    var viewModel: ForgotPasswordViewModelProtocol?
    
    override func viewDidLoad() {
        setupEmailView()
    }
    
    func setupEmailView() {
        emailTextField.placeholder = "Email"
        emailTextField.title = "Email Address"
        emailTextField.tintColor = Colors.overcastBlueColor
        emailTextField.selectedTitleColor = Colors.overcastBlueColor
        emailTextField.selectedLineColor = Colors.overcastBlueColor
        emailTextField.lineHeight = 1.0 // bottom line height in points
        emailTextField.selectedLineHeight = 2.0
        emailTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "envelope.fill")
        imageView.image = image
        emailTextField.rightView = imageView
    }
    
//MARK: IBOActions
    
    @IBAction func showSendVerification(_ sender: Any) {
        requestForgotPassword()
    }
    
//API
    func requestForgotPassword(){
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please enter your email.")
            return
        }
        forgotPassword.emailAddress = email
        
        SHOW_CUSTOM_LOADER()
        self.viewModel?.requestForgotPassword(email: emailTextField.text ?? "", completion: { (response) in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                self.viewModel?.showforgotPasswordVerification()
            }
            else{
                self.showAlertWith(title: "OUPS !", message: response?.message ?? "We're having a problem.\nPlease try again in a few minutes ! ")
            }
        })
    }
    //MARK:IBActions
    
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.stop()
    }
    
}
extension ForgotPasswordViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? ForgotPasswordCoordinator
    }
}
