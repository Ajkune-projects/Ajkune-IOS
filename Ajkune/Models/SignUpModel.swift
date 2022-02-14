//
//  SignUpModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/3/22.
//

import Foundation

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

typealias GiftList = [GiftListElement]
