//
//  RegisterViewModel.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation
import Alamofire

import UIKit

class RegisterViewModel {
    
    private var name: String?
    private var email: String?
    private var password: String?
    
//    private func isDataValid() -> Bool {
//        var isValid = false
//        [name, email,password].forEach { text in
//            isValid = !text.isEmpty && text.count > 0
//        }
//        return isValid
//    }
    
    func signUp() {
            let model = SignUpModel(name: name, email: email, password: password)
            SignUp(model: model).perform { result in
                switch result {
                case .success():
                    // navigate somewhere
                    print("SUCCESS")
                case .failure(let error):
                    print(error)
                }
            }
        
    }
}


struct SignUpModel {
    let name: String?
    let email: String?
    let password: String?
}
