//
//  AccountManager.swift
//  
//
//  Created by Djellza Rrustemi
//

import UIKit

protocol AccountProtocol: class {
    func initLogin()
    func initMainScreen()
    func userLogout()
}

class Account: NSObject {
    
    static let shared = Account()
    weak var delegate: AccountProtocol?

    func initLogin(){
        self.delegate?.initLogin()
    }
    func initMainScreen(){
        self.delegate?.initMainScreen()
    }
    func clear(){
        self.clearSavedData()
        delegate?.userLogout()
    }
    func clearSavedData(){
        UserDefaults.standard.set("", forKey: "USER_TOKEN")
        UserDefaults.standard.set("", forKey: "User_ID")
        UserDefaults.standard.set("", forKey: "Full_NAME")
        
    }

}
