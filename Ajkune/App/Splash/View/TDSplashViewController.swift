//
//  SplashViewController.swift
//
//  Created by Djellza Rrustemi
//

import UIKit
class TDSplashViewController: UIViewController, Storyboarded {
    
    //MARK: - Properties
    var viewModel: TDSplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delay(delay: 1) {
            self.checkToken()
        }
    }
    
    
    //MARK: - Functions
    func checkToken(){
        let token = Defaults.string(forKey: USER_TOKEN)
        if token != "" && token != nil{
            self.viewModel?.goToMain()
        }
        else {
            self.viewModel?.splashShown()
        }
    }
}
