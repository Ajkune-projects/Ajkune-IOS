//
//  LoginVC.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 21.10.21..
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailAddressOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet var ViewBack: UIView!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
        // email validation, password validation
//        checkForTextFieldIsEmpty()
        if let email = emailAddressOutlet.text,
           let password = passwordOutlet.text {
            
            viewModel.login(email: email, password: password) { [weak self] result in
                switch result {
                case .success:
                    self?.navigationController?.popViewController(animated: true)
                case .failure(_):
                    self?.showErrorAlert(message: "Bad credentials")
                }
            }
        }
    }
    
    @IBAction func RegisterDirectionAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func ForgotPasswordAction(_ sender: Any) {
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
