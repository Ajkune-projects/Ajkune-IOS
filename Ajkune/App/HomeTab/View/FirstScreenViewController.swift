//
//  FirstScreenViewController.swift
//
//  Created by Djellza Rrustemi
//

import UIKit
class FirstScreenViewController: UIViewController, Storyboarded {
    
    //MARK: - Properties
    var viewModel: FirstScreenViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    @IBAction func goToSecondScreenButtonPressed(_ sender: Any) {
        self.viewModel?.firstScreenShown()
    }
}
