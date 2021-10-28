//
//  LoginViewModel.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation



class LoginViewModel {
    
    private func isDataValid(for email: String, _ password: String) -> Bool {
        var isValid = false
        [email, password].forEach { text in
            isValid = !text.isEmpty && text.count > 0
        }
        return isValid
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (Result<Void, Error>) -> Void) {
        if isDataValid(for: email, password) {
            Login(email: email, password: password).perform { result in
                switch result {
                    case .success(_):
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        }
    }
}
