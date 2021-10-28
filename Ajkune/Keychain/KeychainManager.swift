//
//  KeychainManager.swift
//  Capital
//
//  Created by Blerd Foniqi on 7/2/21.
//

import Foundation
import KeychainAccess
import Foundation
import KeychainAccess

class KeychainManager {
    enum Keys: String {
        case token
    }

    private let keychain: Keychain

    static let shared = KeychainManager()
    
    var accessToken: String? {
        return keychain[Keys.token.rawValue]
    }

    private init() {
        let seerviceName = Bundle.main.bundleIdentifier ?? "ClickITDev.Ajkune"
        keychain = Keychain(service: seerviceName)
    }

    func store(token: String) {
        keychain[Keys.token.rawValue] = token
    }

    func clearToken() {
        keychain[Keys.token.rawValue] = nil
    }

    func isLoggedIn() -> Bool {
        guard keychain[Keys.token.rawValue] != nil else {
            return false
        }
        return true
    }
    
    func clearAll() {
        do {
            try keychain.removeAll()
        } catch {
            print(error.localizedDescription)
        }
    }
}
