//
//  Products.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 25.10.21..
//

import Foundation

struct Products: Codable {
    let id: Int
    let name: String?
    let initial_price: String?
    let price: String?
    let rating: Int?
    let desc_de: String?
    let desc_en: String?
    let desc_fr: String?
    let desc_it: String?
    let image: String?
    let wp_product_url: String?
    let status: Int?
    let created_at: String?
    let updated_at: String?
}
