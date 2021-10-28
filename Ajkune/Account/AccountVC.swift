//
//  AccountVC.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import UIKit

class AccountVC: UIViewController {
    @IBOutlet weak var ProfileLOutlet: UIButton!
    
    @IBOutlet weak var LanguageOutlet: UIButton!
    @IBOutlet weak var LogOutOutlet: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        if KeychainManager.shared.isLoggedIn() == true {
            LogOutOutlet.titleLabel?.text = "Logout"
        } else {
            LogOutOutlet.titleLabel?.text = "Login"
        }
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func ProfileAction(_ sender: Any) {
    }
    @IBAction func LanguageAction(_ sender: Any) {
    }
    
    @IBAction func LogoutAction(_ sender: Any) {
        
        if KeychainManager.shared.isLoggedIn() == true {
            showConfirmalert(message: "Are you sure you want to logout?") {
                KeychainManager.shared.clearAll()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController (vc, animated: true)
            }
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController (vc, animated: true)
        }
    }
}
