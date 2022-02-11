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

// MARK: - User
struct Usr: Codable {
    var id: Int?
    var name, email, emailVerifiedAt, currentTeamID: String?
    var profilePhotoPath: String?
    var createdAt, updatedAt: String?
    var activeProfile: Int?
    var lastName, gender, dateOfBirth, phone: String?
    var address, street: String?
    var zipCode: Int?
    var country, role: String?
    var imageName: String?
    var hasGift: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case emailVerifiedAt = "email_verified_at"
        case currentTeamID = "current_team_id"
        case profilePhotoPath = "profile_photo_path"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case activeProfile = "active_profile"
        case lastName = "last_name"
        case gender
        case dateOfBirth = "date_of_birth"
        case phone, address, street
        case zipCode = "zip_code"
        case country, role
        case imageName = "image_name"
        case hasGift = "has_gift"
    }
}

struct UserProfile: Codable {
    var name, lastName, gender, dateOfBirth: String?
    var phone, address, street, zipCode: String?
    var country, base64Img: String?

    enum CodingKeys: String, CodingKey {
        case name
        case lastName = "last_name"
        case gender
        case dateOfBirth = "date_of_birth"
        case phone, address, street
        case zipCode = "zip_code"
        case country
        case base64Img = "base64_img"
    }
}
