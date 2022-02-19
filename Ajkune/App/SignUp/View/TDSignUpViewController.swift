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
    @IBOutlet weak var alreadyMemberLbl: UILabel!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK: - Properties
    var coordinator: SignUpCoordinator?
    var viewModel: SignUpViewModelProtocol?

    var isSecure = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUIDesignFields()
            showHidePass()
            registerBtn.setTitle("register".localized, for: .normal)
            alreadyMemberLbl.text = "already_a_member".localized
            loginBtn.setTitle("login".localized, for: .normal)
            
        }
    func addObservers(){
            registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
        }
        
        @objc func updateLang(notification: Notification) {
            localize()
        }
        //MARK: - Functions
        func localize(){
            setupUIDesignFields()
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
        
         func setupUIDesignFields(){
            registerBtn.setTitle("register".localized, for: .normal)
            alreadyMemberLbl.text = "already_a_member".localized
            loginBtn.setTitle("login".localized, for: .normal)
            setupEmailView()
            setupFirstName()
            SetupLastName()
            setupPassowrd()
            setupConfrimPassword()
        }
        
        private func setupEmailView() {
            emailAddressTextField.placeholder = "e_mail_address".localized
            emailAddressTextField.title = "e_mail_address".localized
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
            firstNameTextField.placeholder = "first_name".localized
            firstNameTextField.title = "first_name".localized
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
            lastNameTextField.placeholder = "last_name".localized
            lastNameTextField.title = "last_name".localized
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
            passwordTextField.placeholder = "password".localized
            passwordTextField.title = "password".localized
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
            confirmPasswordTextField.placeholder = "confirm_password".localized
            confirmPasswordTextField.title = "confirm_password".localized
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
                self.showAlertWith(title: "Ajkune", message: "empty_email".localized)
                return
            }
            if !isValidEmail(emailAddressTextField.text ?? ""){
                self.emailAddressTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "invalid_email".localized)
               return
                
            }
            guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
                self.firstNameTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "empty_name".localized)
                return
            }
            guard let lastname = lastNameTextField.text, !lastname.isEmpty else {
                self.lastNameTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message:  "empty_lastName".localized)
                return
            }
            guard let pass = passwordTextField.text, !pass.isEmpty else {
                self.passwordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "empty_password".localized)
                return
            }
            guard let confirmPass = confirmPasswordTextField.text, !confirmPass.isEmpty else {
                self.confirmPasswordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "confirm_new_password".localized)
                return
            }
            guard (confirmPass == pass) else {
                self.passwordTextField.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "register_password_not_match".localized)
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
                Account.shared.initLogin()
            }else{
                self.showOKAlert(title: "Error", message: "registration_failed".localized)
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
