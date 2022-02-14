//
//  UIViewController+Additions.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

import UIKit
extension UIViewController {
    func showAlertWith(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
    func showOKAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //hide keyboard
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UIApplication {
    class func openAppSettings() {
        guard let url = URL(string: self.openSettingsURLString) else { return }
        self.shared.open(url, options: [:], completionHandler: nil)
    }
    
    class func openSubscriptionManagement() {
        guard let url = URL(string: "itms://apps.apple.com/account/subscriptions") else { return }
        self.shared.open(url, options: [:], completionHandler: nil)
    }
}
