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
    case requestForgotPassword(email: String)
    case checkResetPasswordCode(resetPasswordCode: String)
    case requestResetPassword(data: ResetPasswordModel)
    case getBanner
//Products
    case getProducts
    case getProductsByID(Id:Int)
    case getProductDetails(Id:Int)
    case getCategories
    case addComment(product_id:String,title:String, comment:String)
    case filterProducts(minValue:String,maxValue:String,type:String)
    
    //User
    case getUserDetails
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login,.signUp, .requestForgotPassword, .checkResetPasswordCode, .requestResetPassword,.addComment:
            return .post
        case .getProducts, .getProductsByID,.getCategories,.getBanner,.getProductDetails,.filterProducts,.getUserDetails:
            return .get
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
        case .requestForgotPassword:
            return "/forgotEmail"
        case .checkResetPasswordCode:
            return "/forgotEmail/code"
        case .requestResetPassword:
            return "/forgotEmail/changePassword"
        case . getProducts:
            return "/products"
        case .getProductsByID(let id):
            return "/categories/\(id)"
        case .getCategories:
           return  "/categories"
        case .getBanner:
            return "/banner"
        case .getProductDetails(let id):
            return "/products/\(id)"
        case .addComment:
            return "/comment/new"
        case .filterProducts(let minValue, let maxValue, let type):
            return "/filter/\(minValue)/\(maxValue)/\(type)"
        case .getUserDetails:
            return "/get_user"
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
        case .requestForgotPassword(let email):
            return ["email":email]
        case .checkResetPasswordCode(let resetPasswordCode):
            return ["code":resetPasswordCode]
        case .requestResetPassword(let data):
            return [ "code":data.code,
                     "email":data.email,
                     "password":data.password,
                     "confirmation_password":data.confirmation_password]
        case .getProducts,.getProductsByID,.getCategories,.getBanner,.getProductDetails,.filterProducts:
            return nil
        case .addComment(let product_id, let title, let comment):
            return ["product_id":product_id,
                    "title":title,
                    "comment":comment]
        case .getUserDetails:
            let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80NS43Ny41NC4xNThcL2FwaVwvbG9naW4iLCJpYXQiOjE2NDQxOTM3MDUsImV4cCI6MTY0NTcwNTcwNSwibmJmIjoxNjQ0MTkzNzA1LCJqdGkiOiIxeTBXQ3pYYVZpRGRHUW9PIiwic3ViIjo3LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2jahgdRDc1nJEpSLX6GXf7k2Ou44pC4r-OUrre9iA40"
            return ["token":token]
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

