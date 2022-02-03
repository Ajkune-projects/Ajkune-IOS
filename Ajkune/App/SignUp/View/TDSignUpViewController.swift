//
//  SignUpViewController.swift
//
//
//  Created by Djellza Rrustemi on 03.02.2022.
//

import UIKit
import SkyFloatingLabelTextField
class SignUpViewController: UIViewController, Storyboarded {
    //MARK: - IBOutlets
        @IBOutlet weak var emailAddressTextField: SkyFloatingLabelTextField!
        @IBOutlet weak var firstNameTextField: SkyFloatingLabelTextField!
        @IBOutlet weak var lastNameTextField: SkyFloatingLabelTextField!
        @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
        @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
        @IBOutlet var backView: UIView!
        
    //MARK: - Properties
    var coordinator: SignUpCoordinator?
    var viewModel: SignUpViewModelProtocol?

    var isSecure = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUIDesignFields()
            showHidePass()
            
        }
    
    func showHidePass(){
        if isSecure{
            self.isSecure = false
            self.passwordTextField.isSecureTextEntry = true
        }
        else{
            self.isSecure = true
            self.passwordTextField.isSecureTextEntry = false
        }
    }
        
        @IBAction func backToLogin(_ sender: Any) {
            Account.shared.initLogin()
            Account.shared.clear()
        }
        
        private func setupUIDesignFields(){
            setupEmailView()
            setupFirstName()
            SetupLastName()
            setupPassowrd()
            setupConfrimPassword()
        }
        
        private func setupEmailView() {
            emailAddressTextField.placeholder = "Email"
            emailAddressTextField.title = "Email Address"
            emailAddressTextField.tintColor = Colors.overcastBlueColor
            emailAddressTextField.selectedTitleColor = Colors.overcastBlueColor
            emailAddressTextField.selectedLineColor = Colors.overcastBlueColor
            emailAddressTextField.lineHeight = 1.0 // bottom line height in points
            emailAddressTextField.selectedLineHeight = 2.0
            emailAddressTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "envelope.fill")
            imageView.image = image
            emailAddressTextField.rightView = imageView
        }
        
        private func setupFirstName() {
            firstNameTextField.placeholder = "First name"
            firstNameTextField.title = "First Name"
            firstNameTextField.tintColor = Colors.overcastBlueColor
            firstNameTextField.selectedTitleColor = Colors.overcastBlueColor
            firstNameTextField.selectedLineColor = Colors.overcastBlueColor
            firstNameTextField.lineHeight = 1.0 // bottom line height in points
            firstNameTextField.selectedLineHeight = 2.0
            firstNameTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "person.fill")
            imageView.image = image
            firstNameTextField.rightView = imageView
        }
        
        private func SetupLastName() {
            lastNameTextField.placeholder = "Last name"
            lastNameTextField.title = "Last Name"
            lastNameTextField.tintColor = Colors.overcastBlueColor
            lastNameTextField.selectedTitleColor = Colors.overcastBlueColor
            lastNameTextField.selectedLineColor = Colors.overcastBlueColor
            lastNameTextField.lineHeight = 1.0 // bottom line height in points
            lastNameTextField.selectedLineHeight = 2.0
            lastNameTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "person.fill")
            imageView.image = image
            lastNameTextField.rightView = imageView
        }
        
        private func setupPassowrd() {
            passwordTextField.placeholder = "Password"
            passwordTextField.title = "Password"
            passwordTextField.tintColor = Colors.overcastBlueColor
            passwordTextField.selectedTitleColor = Colors.overcastBlueColor
            passwordTextField.selectedLineColor = Colors.overcastBlueColor
            passwordTextField.lineHeight = 1.0 // bottom line height in points
            passwordTextField.selectedLineHeight = 2.0
            passwordTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "eye.fill")
            imageView.image = image
            passwordTextField.rightView = imageView
        }
        
        private func setupConfrimPassword() {
            confirmPasswordTextField.placeholder = "Confirm password"
            confirmPasswordTextField.title = "Confirm Password"
            confirmPasswordTextField.tintColor = Colors.overcastBlueColor
            confirmPasswordTextField.selectedTitleColor = Colors.overcastBlueColor
            confirmPasswordTextField.selectedLineColor = Colors.overcastBlueColor
            confirmPasswordTextField.lineHeight = 1.0 // bottom line height in points
            confirmPasswordTextField.selectedLineHeight = 2.0
            confirmPasswordTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "eye.fill")
            imageView.image = image
            confirmPasswordTextField.rightView = imageView
        }
        
        func validateFields(){
            guard let emailAddress = emailAddressTextField.text, !emailAddress.isEmpty else {
                self.emailAddressTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Please write your email address!")
                return
            }
            if !isValidEmail(emailAddressTextField.text ?? ""){
                self.emailAddressTextField.becomeFirstResponder()
                self.showAlertWith(title: "Teed Up", message: "Invalid email.")
               return
                
            }
            guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
                self.firstNameTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Please write your name!")
                return
            }
            guard let lastname = lastNameTextField.text, !lastname.isEmpty else {
                self.lastNameTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Please write your Last Name!")
                return
            }
            guard let pass = passwordTextField.text, !pass.isEmpty else {
                self.passwordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Please write your password!")
                return
            }
            guard let confirmPass = confirmPasswordTextField.text, !confirmPass.isEmpty else {
                self.confirmPasswordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Please confirm password!")
                return
            }
            guard (confirmPass == pass) else {
                self.passwordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "Passwords do not match!")
                return
            }
            
            
        }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBAction func createAccountAction(_ sender: Any) {
        validateFields()
        let user = UserSignUpModel(name: firstNameTextField.text ?? "", email: emailAddressTextField.text ?? "", password: passwordTextField.text ?? "")
        registerUser(model: user)
    }
    func registerUser(model:UserSignUpModel){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.requestSignUp(model: model, completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                self.showOKAlert(title: "Success", message: "You did it!!!!")
                
            }
        })
    }
}


//MARK : TDCoordinated
extension SignUpViewController : TDCoordinated {
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? SignUpCoordinator
    }
}
