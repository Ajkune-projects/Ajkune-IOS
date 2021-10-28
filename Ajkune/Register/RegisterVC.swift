//
//  RegisterVC.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 21.10.21..
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfrimPassword: UITextField!
    
    @IBOutlet var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

       view.addGestureRecognizer(tap)
        
        
    }
    @IBAction func CreateAccount(_ sender: Any) {
        
        let model = SignUpModel(name: firstName.text, email: emailAddress.text, password: Password.text)
        
        SignUp(model: model).perform { response in
            switch response {
            case .success:
                print("Success ✅")
                self.navigationController?.popViewController(animated: true)
                print(model.name)
            case .failure(let error):
                print("Error register ❌")
                print(error.localizedDescription)
                self.showErrorAlert(message: error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func BackToLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
