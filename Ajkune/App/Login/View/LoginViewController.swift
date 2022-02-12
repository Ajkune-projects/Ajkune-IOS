//
//  LoginViewController.swift
//
//
//  Created by Djellza Rrustemi on 03.02.2022
//

import UIKit
import TextFieldEffects
import SkyFloatingLabelTextField
class LoginViewController: UIViewController, Storyboarded {
    
    //MARK: IBOutlets
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var securePasswordIcon: UIButton!
    
    
    
    //MARK: - Properties
    var viewModel: LoginViewModelProtocol?
    var coordinator: LoginCoordinator?
    var isSecure = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmailTxt()
        setupPassTxt()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBFunctions
    func setupUI(){
        showHidePass()
        self.emailTextField.text = "djellzarrustemii@gmail.com"
        self.passwordTextField.text = "123456"
        
    }
    
    func setupEmailTxt(){
            emailTextField.title = "Email Address"
            emailTextField.tintColor = Colors.overcastBlueColor
            emailTextField.selectedTitleColor =  Colors.overcastBlueColor
            emailTextField.selectedLineColor =  Colors.overcastBlueColor
            emailTextField.lineHeight = 1.0 // bottom line height in points
            emailTextField.selectedLineHeight = 2.0
            emailTextField.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image = UIImage(systemName: "envelope.fill")
            imageView.image = image
            emailTextField.rightView = imageView
    }
    func setupPassTxt(){
        passwordTextField.title = "Password"
        passwordTextField.tintColor = Colors.overcastBlueColor
        passwordTextField.selectedTitleColor = Colors.overcastBlueColor
        passwordTextField.selectedLineColor = Colors.overcastBlueColor
        passwordTextField.lineHeight = 1.0
        passwordTextField.selectedLineHeight = 2.0
        }
    
    func showHidePass(){
        if isSecure{
            let image = UIImage(named: "eye")
            self.isSecure = false
            self.securePasswordIcon.setImage(image, for: .normal)
            self.passwordTextField.isSecureTextEntry = true
        }
        else{
            let image = UIImage(named: "eye")
            self.isSecure = true
            self.securePasswordIcon.setImage(image, for: .normal)
            self.passwordTextField.isSecureTextEntry = false
        }
    }
    //MARK: - IBFunctions
    func login(){
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please enter your email.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            self.passwordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please enter your password.")
            return
        }
        SHOW_CUSTOM_LOADER()
        self.viewModel?.requestLogin(email: email, password: passwordTextField.text ?? "", completion: { (response) in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                Defaults.setValue(response?.token, forKey: USER_TOKEN)
                        self.viewModel?.loginSuccessful()
            }
            else{
                self.showAlertWith(title: "OUPS !", message: "The username or password is incorrect")
            }
        })
    }
    //MARK: IBFunctions
    @IBAction func signUpButtonPressed(_ sender: Any) {
        self.viewModel?.showSignUp()
    }
    @IBAction func showHideButton(_ sender: Any) {
        showHidePass()
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        login()
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        self.viewModel?.showForgotPassword()
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
