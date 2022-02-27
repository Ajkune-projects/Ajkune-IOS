//
//  GlobalData.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/3/22.
//

import Foundation
public var changeLanguage = ""

struct forgotPassword{
    static var  emailAddress:String? = ""
    static var  resetCode:String? = ""
}

struct globalData{
    static var defaultToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80NS43Ny41NC4xNThcL2FwaVwvbG9naW4iLCJpYXQiOjE2NDU5OTg0NjUsImV4cCI6MTY0NzUxMDQ2NSwibmJmIjoxNjQ1OTk4NDY1LCJqdGkiOiJqYXpUbktjQmxsMktzUVB3Iiwic3ViIjo1LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.5EMVtGhsCCLkSRcyXcDv_uy-btVTXPzEcZUZ7__4Cfo"
    static var categoryIndexPath = IndexPath(row: 0, section: 0)
    static var categoryIndexPathOffer = IndexPath(row: 0, section: 0)
    static var fromAllCategories: Bool = false
    static var fromAllCategoriesOffer: Bool = false
    static var categorySelectedOffer:Int = 0
    static var categorySelected:Int = 0
    static var filteredProducts = [Products]()
    static var fromFilter = false
    static var isOffer:Bool? = false
    static var filterFromOffer:Bool? = false
}

struct ProfileDetails{
    static var fullAddress:String = ""
    static var street:String = ""
    static var city:String = ""
    static var zipCode:String = ""
    static var country:String = ""
}
