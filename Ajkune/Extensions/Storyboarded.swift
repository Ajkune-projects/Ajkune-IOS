//
//  Storyboarded.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//
import UIKit

protocol Storyboarded {
    static func instantiate(_ storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

extension UIStoryboard {
    static var initialScreen: UIStoryboard {
        return UIStoryboard(name: "TDInitialScreen", bundle: nil)
    }
    static var splash: UIStoryboard {
        return UIStoryboard(name: "TDSplash", bundle: nil)
    }
    static var tabbar: UIStoryboard {
        return UIStoryboard(name: "TabBar", bundle: nil)
    }
    static var login: UIStoryboard {
        return UIStoryboard(name: "Login", bundle: nil)
    }
    static var signUp: UIStoryboard {
         return UIStoryboard(name: "SignUp", bundle: nil)
    }
    static var homeTab: UIStoryboard {
        return UIStoryboard(name: "HomeTab", bundle: nil)
    }
    static var settingsTab: UIStoryboard {
         return UIStoryboard(name: "SettingsTab", bundle: nil)
    }
    
    static var forgetPassword: UIStoryboard {
         return UIStoryboard(name: "ForgotPassword", bundle: nil)
    }
    static var forgetPasswordVerification: UIStoryboard {
         return UIStoryboard(name: "ForgotPasswordVerification", bundle: nil)
    }
    static var resetPassword: UIStoryboard {
         return UIStoryboard(name: "ResetPassword", bundle: nil)
    }

    static var productDetails: UIStoryboard {
         return UIStoryboard(name: "ProductDetails", bundle: nil)
    }
    static var webView: UIStoryboard {
         return UIStoryboard(name: "WebView", bundle: nil)
    }
    static var seeAllCategories: UIStoryboard {
         return UIStoryboard(name: "SeeAllCategories", bundle: nil)
    }
    static var filterProducts: UIStoryboard {
         return UIStoryboard(name: "FilterProducts", bundle: nil)
    }
    static var profile: UIStoryboard {
         return UIStoryboard(name: "Profile", bundle: nil)
    }
    static var userAddress: UIStoryboard {
         return UIStoryboard(name: "UserAddress", bundle: nil)
    }
}


extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}
