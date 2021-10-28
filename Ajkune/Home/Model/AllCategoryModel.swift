//
//  AllCategoryModel.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 27.10.21..
//

import Foundation

struct Categories: Codable  {
    let id: Int
    let name: String?
    let position: Int?
    let status: Int?
    let created_at: String?
    let updated_at: String?
}
