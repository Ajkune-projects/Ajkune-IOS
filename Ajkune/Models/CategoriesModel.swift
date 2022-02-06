//
//  CategoriesModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import Foundation
struct Categories: Codable  {
    var id: Int
    let name: String?
    let position: Int?
    let status: Int?
    let created_at: String?
    let updated_at: String?
}
