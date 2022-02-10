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
    static var fromAllCategories: Bool = false
    static var categorySelected:Int = 0
    static var filteredProducts = [Products]()
    static var fromFilter = false
}

struct ProfileDetails{
    static var address:String = ""
}
