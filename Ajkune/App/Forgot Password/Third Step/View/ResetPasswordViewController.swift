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
    @IBOutlet weak var resetPassBtn: UIButton!
    @IBOutlet weak var confirmPassDesc: UILabel!
    @IBOutlet weak var confirmPassTitle: UILabel!
    //MARK:Properties
    var coordinator: ResetPasswordCoordinator?
    var viewModel: ResetPasswordViewModelProtocol?
    var isSecure = true
    
    override func viewDidLoad() {
        showHidePass()
        setupPasswordView()
        setupConfirmPassView()
        addObservers()
        resetPassBtn.setTitle("reset_password".localized, for: .normal)
        confirmPassTitle.text = "create_new_password".localized
        confirmPassDesc.text = "enter_your_new_password".localized
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    
    @objc func updateLang(notification: Notification) {
        confirmPassTitle.text = "create_new_password".localized
        confirmPassDesc.text = "enter_your_new_password".localized
        resetPassBtn.setTitle("reset_password".localized, for: .normal)
        setupPasswordView()
        setupConfirmPassView()
        
    }
    func setupPasswordView() {
        newPasswordTextField.placeholder = "new_password".localized
        newPasswordTextField.title = "new_password".localized
        newPasswordTextField.tintColor = Colors.overcastBlueColor
        newPasswordTextField.selectedTitleColor = Colors.overcastBlueColor
        newPasswordTextField.selectedLineColor = Colors.overcastBlueColor
        newPasswordTextField.lineHeight = 1.0 // bottom line height in points
        newPasswordTextField.selectedLineHeight = 2.0
        newPasswordTextField.rightViewMode = UITextField.ViewMode.always
    }
    func setupConfirmPassView() {
        confirmPassword.placeholder = "confirm_new_password".localized
        confirmPassword.title = "confirm_new_password".localized
        confirmPassword.tintColor = Colors.overcastBlueColor
        confirmPassword.selectedTitleColor = Colors.overcastBlueColor
        confirmPassword.selectedLineColor = Colors.overcastBlueColor
        confirmPassword.lineHeight = 1.0 // bottom line height in points
        confirmPassword.selectedLineHeight = 2.0
    }
    //API
    func requestResetPassword(){
        guard let newPassword = newPasswordTextField.text, !newPassword.isEmpty else {
            self.newPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message:"empty_password".localized)
            return
        }
        guard let confirmNewPassword = confirmPassword.text, !confirmNewPassword.isEmpty else {
            self.confirmPassword.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "confirm_new_password".localized)
            return
        }
        guard (newPassword == confirmNewPassword) else {
            self.showAlertWith(title: "Ajkune", message: "register_password_not_match".localized)
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
        if isSecure{
           
            self.isSecure = false
            self.newPasswordTextField.isSecureTextEntry = true
            self.confirmPassword.isSecureTextEntry = true
        }
        else{
            self.isSecure = true
            self.newPasswordTextField.isSecureTextEntry = false
            self.confirmPassword.isSecureTextEntry = false
        }
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
