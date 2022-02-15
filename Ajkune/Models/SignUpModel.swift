//
//  SignUpModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/3/22.
//

import Foundation
import UIKit
import SwiftFortuneWheel

struct UserSignUpModel: Codable{
        var name, email, password: String?
    }
struct ResetPasswordModel: Codable {
    var code, email, password, confirmation_password: String?
}
struct Users: Codable {
    var user: Usr?
}
struct UserResponse: Codable {
    var user: UsrResponse?
}

// MARK: - User
struct Usr: Codable {
    var id, current_team_id: Int?
    var name, email, email_verified_at: String?
    
    var profile_photo_path: String?
    var created_at, updated_at: String?
    var active_profile: Int?
    var last_name, gender, date_of_birth, phone: String?
    var address, street: String?
    var zip_code: Int?
    var country, role: String?
    var image_name: String?
    var has_gift: Int?
}

struct UserProfile: Codable {
    var name, last_name, gender, date_of_birth: String?
    var phone, address, street, zip_code: String?
    var country, base64_img: String?
}

struct UsrResponse: Codable {
    var id, current_team_id: Int?
    var name, email, email_verified_at: String?
    
    var profile_photo_path: String?
    var created_at, updated_at: String?
    var active_profile: Int?
    var last_name, gender, date_of_birth, phone: String?
    var address, street: String?
    var zip_code: String?
    var country, role: String?
    var image_name: String?
    var has_gift: Int?
}

// MARK: - Gift
struct Gift: Codable {
    var success: Bool?
    var message: String?
    var userHasGift: Bool?
}
//struct AddGift: Codable {
//    var success: Bool?
//    var message: String?
//    var gift: GiftListElement?
//}
struct GiftListElement: Codable {
    var id: Int?
    var title, giftListDescription: String?
    var imageURL: String?
    var status: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case giftListDescription = "description"
        case imageURL = "image_url"
        case status
    }
}

struct AddGift: Codable {
    var success: Bool?
    var message: String?
    var gift: Gift1?
}

// MARK: - Gift
struct Gift1: Codable {
    var id: Int?
    var title, giftDescription: String?
    var imageURL: String?
    var status: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case giftDescription = "description"
        case imageURL = "image_url"
        case status
    }
}
struct OfferDetail: Codable {
    var id: Int?
    var name, initial_price, price: String?
    var rating: Int?
    var desc_de, desc_en, desc_fr, desc_it: String?
    var image: String?
    var wp_product_url: String?
    var status: Int?
    var created_at, updated_at: String?
    var has_time: Int?
    var comments_offer: [CommentsOffer]?
}

// MARK: - CommentsOffer
struct CommentsOffer: Codable {
    var id, user_id, product_id: Int?
    var title, comment, created_at, updated_at: String?
    var laravel_through_key: Int?
    var user: User?
}
