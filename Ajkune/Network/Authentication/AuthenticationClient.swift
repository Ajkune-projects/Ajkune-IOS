//
//  TDAuthenticationClient.swift

//
//  Created by Djellza Rrustemi
//

import Alamofire
import PromisedFuture
class AuthenticationClient {
    
    static func getBanner() -> Future<[Banner], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getBanner)
    }
    static func login(email: String, password: String) -> Future<LoginResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.login(email: email, password: password))
    }
    static func signUp(model: UserSignUpModel) -> Future<ServerResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.signUp(userModel: model))
    }
    static func requestForgotPassword(email: String) -> Future<ServerResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.requestForgotPassword(email: email))
    }
    static func checkResetPasswordCode(resetPasswordCode: String) -> Future<ServerResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.checkResetPasswordCode(resetPasswordCode: resetPasswordCode))
    }
    static func requestResetPassword(data: ResetPasswordModel) -> Future<ServerResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.requestResetPassword(data: data))
    }
    static func getALLProducts() -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProducts)
    }
    static func getCategories() -> Future<[Categories], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getCategories)
    }
    static func getProductsByID(id:Int) -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductsByID(Id: id))
    }
    static func getProductDetails(id:Int) -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductDetails(Id: id))
    }
}
