//
//  ServerResponse.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

import Foundation

struct ServerResponse: Codable {
    let message: String?
    let success: Bool?
}

struct LoginResponse: Codable {
    let success : Bool?
    let token : String?
}
