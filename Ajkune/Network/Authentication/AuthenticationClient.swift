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
    static func getALLProductsFromOffer() -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductsFromOffer)
    }
    static func getCategories() -> Future<[Categories], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getCategories)
    }
    static func getProductsByID(id:Int) -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductsByID(Id: id))
    }
    static func getProductsByIdOffer(id:Int) -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductsByIdOffer(Id: id))
    }
    static func getProductDetails(id:Int) -> Future<[ProductDetails], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductDetails(Id: id))
    }
    static func getOfferDetails(id:Int) -> Future<[OfferDetail], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getProductsByIdOffer(Id: id))
    }
    static func addComment(product_id:String,title:String, comment:String) -> Future<[ProductDetails], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.addComment(product_id: product_id, title: title, comment: comment))
    }
    static func addOfferComment(product_id:String,title:String, comment:String) -> Future<[OfferDetail], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.addOfferComment(product_id: product_id, title: title, comment: comment))
    }
    static func filterProducts(maxValue:String, minValue:String, type:String) -> Future<[Products], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.filterProducts(minValue: minValue, maxValue: maxValue, type: type))
    }
    static func getUserDetails() -> Future<Users, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getUserDetails)
    }
    static func verificationProfile(user:UserProfile?) -> Future<UserResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.verificationUser(user: user))
    }
    static func hasGiftUser() -> Future<Gift, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.hasGiftUser)
    }
    static func luckyWheelGifts() -> Future<[GiftListElement], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.luckyWheelGifts)
    }
    static func addGift(id:Int) -> Future<AddGift, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.addGift(Id: id))
    }
    static func getMyGifts() -> Future<[Gift1], Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.getMyGifts)
    }
    static func deleteUser() -> Future<ServerResponse, Error> {
        return TDAPIClient.performRequest(route: TDAuthenticationEndpoint.deleteUser)
    }
}
