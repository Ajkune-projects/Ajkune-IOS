//
//  TDAuthenticationEndpoint.swift
//
//  Created by Djellza Rrustemi
//

import UIKit
import Alamofire

enum TDAuthenticationEndpoint: TDAPIConfiguration {
    
    case login(email:String, password:String)
    case signUp(userModel: UserSignUpModel)

    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login,.signUp:
            return .post
//        case :
//            return .get
//        case :
//            return .delete
//        case :
//            return .put
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .signUp:
            return "/register"
            
    }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
       
        case .signUp(let userModel):
            return[  "name":userModel.name,
                     "email":userModel.email,
                     "password":userModel.password]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try TDAPIConstants.DevelopmentServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        print("urlRequest: \(urlRequest)")
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        // Authorization
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer \(UserDefaults.standard.value(forKey: "USER_TOKEN") ?? "cHJqZXRfY2xpZW50X2lkOnByamV0X3NlY3JldA==")", forHTTPHeaderField: "Authorization")
        // Parameters
        if let parameters = parameters {
            print(parameters)
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}

