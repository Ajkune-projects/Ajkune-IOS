//
//  GlobalData.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/3/22.
//

import Foundation

struct forgotPassword{
    static var  emailAddress:String? = ""
    static var  resetCode:String? = ""
}

struct globalData{
    static var categoryIndexPath = IndexPath(row: 0, section: 0)
    static var categoryIndexPathOffer = IndexPath(row: 0, section: 0)
    static var fromAllCategories: Bool = false
    static var fromAllCategoriesOffer: Bool = false
    static var categorySelectedOffer:Int = 0
    static var categorySelected:Int = 0
    static var filteredProducts = [Products]()
    static var fromFilter = false
    static var isOffer:Bool? = false
}

struct ProfileDetails{
    static var fullAddress:String = ""
    static var street:String = ""
    static var city:String = ""
    static var zipCode:String = ""
    static var country:String = ""
}
