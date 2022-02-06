//
//  ProductsModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import Foundation

struct Products: Codable {
    let id: Int?
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

struct ProductsByID: Codable {
    let id: Int?
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
    let pivot: Pivot
}

struct Pivot : Codable {
    let category_id: Int?
    let product_id: Int?
}

struct Banner: Codable {
    var id: Int?
    var title, initial_price, price: String?
    var image_path: String?
    var is_active: Int?

}
