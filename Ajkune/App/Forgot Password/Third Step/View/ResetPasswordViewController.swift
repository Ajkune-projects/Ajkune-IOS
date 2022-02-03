//
//  ForgotPasswordViewController.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
import UIKit
import TextFieldEffects
import SkyFloatingLabelTextField
class ResetPasswordViewController: UIViewController, Storyboarded {
    //MARK:IBOutlets
    @IBOutlet weak var newPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassword: SkyFloatingLabelTextField!
    
    //MARK:Properties
    var coordinator: ResetPasswordCoordinator?
    var viewModel: ResetPasswordViewModelProtocol?
    var isSecure = true
    
    override func viewDidLoad() {
        showHidePass()
        setupPasswordView()
        setupConfirmPassView()
    }
    func setupPasswordView() {
        newPasswordTextField.placeholder = "New Password"
        newPasswordTextField.title = "New Password"
        newPasswordTextField.tintColor = Colors.overcastBlueColor
        newPasswordTextField.selectedTitleColor = Colors.overcastBlueColor
        newPasswordTextField.selectedLineColor = Colors.overcastBlueColor
        newPasswordTextField.lineHeight = 1.0 // bottom line height in points
        newPasswordTextField.selectedLineHeight = 2.0
        newPasswordTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "eye.fill")
        imageView.image = image
        newPasswordTextField.rightView = imageView
    }
    func setupConfirmPassView() {
        confirmPassword.placeholder = "Confirm Password"
        confirmPassword.title = "Confirm Password"
        confirmPassword.tintColor = Colors.overcastBlueColor
        confirmPassword.selectedTitleColor = Colors.overcastBlueColor
        confirmPassword.selectedLineColor = Colors.overcastBlueColor
        confirmPassword.lineHeight = 1.0 // bottom line height in points
        confirmPassword.selectedLineHeight = 2.0
        confirmPassword.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "eye.fill")
        imageView.image = image
        confirmPassword.rightView = imageView
    }
    //API
    func requestResetPassword(){
        guard let newPassword = newPasswordTextField.text, !newPassword.isEmpty else {
            self.newPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message:"Please enter your password.")
            return
        }
        guard let confirmNewPassword = confirmPassword.text, !confirmNewPassword.isEmpty else {
            self.confirmPassword.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please confirm your password.")
            return
        }
        guard (newPassword == confirmNewPassword) else {
            self.showAlertWith(title: "Ajkune", message: "Passwords do not match.")
            return
        }
        SHOW_CUSTOM_LOADER()
        let passwordData = ResetPasswordModel(code: forgotPassword.resetCode, email: forgotPassword.emailAddress, password: newPassword, confirmation_password: confirmNewPassword)
        self.viewModel?.requestResetPassword(data:passwordData , completion: { (response) in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                Account.shared.initLogin()
                Account.shared.clear()
            }
            else{
            
            }
        })
    }
    func showHidePass(){
//        if isSecure{
//            let image = UIImage(named: "eye-close-up") as UIImage?
//            self.isSecure = false
//            self.secureEyeIcon.setImage(image, for: .normal)
//            self.newPasswordTextField.isSecureTextEntry = true
//            self.confirmPassword.isSecureTextEntry = true
//        }
//        else{
//            let image = UIImage(named: "eye") as UIImage?
//            self.isSecure = true
//            self.secureEyeIcon.setImage(image, for: .normal)
//            self.newPasswordTextField.isSecureTextEntry = false
//            self.confirmPassword.isSecureTextEntry = false
//        }
    }
    //MARK:IBActions
    @IBAction func changePassword(_ sender: Any) {
        requestResetPassword()
    }
    @IBAction func showHidePassAction(_ sender: Any) {
        showHidePass()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.stop()
    }
    
    
}
extension ResetPasswordViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? ResetPasswordCoordinator
    }
}
