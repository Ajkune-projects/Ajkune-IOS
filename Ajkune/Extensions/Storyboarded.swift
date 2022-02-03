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
        return UIStoryboard(name: "TDTabBar", bundle: nil)
    }
    static var login: UIStoryboard {
        return UIStoryboard(name: "Login", bundle: nil)
    }
    static var signUp: UIStoryboard {
         return UIStoryboard(name: "SignUp", bundle: nil)
    }
    static var firstScreen: UIStoryboard {
        return UIStoryboard(name: "FirstScreen", bundle: nil)
    }
}


extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}