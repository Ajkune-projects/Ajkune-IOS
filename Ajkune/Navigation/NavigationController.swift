//
//  NavigationController.swift
//  Real-Estate
//
//  Created by Pajaziti Labinot on 12.2.21..
//


import UIKit

final class NavigationController: UINavigationController {
    
    
    override init(rootViewController: UIViewController) {
        
        super.init(rootViewController: rootViewController)
        navigationBar.tintColor = .orange

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
