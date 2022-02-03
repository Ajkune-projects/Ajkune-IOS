//
//  MainTabBarContainer.swift
//  
//
//  Created byDjellza Rrustemi
//

import UIKit

class MainTabBarContainer: UITabBarController, Storyboarded {
    let layer = CAShapeLayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: 10, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: 18).cgPath
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.borderWidth = 1.0
        layer.opacity = 1
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
        if let items = self.tabBar.items {
            items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0) }
        }
        

        self.tabBar.itemWidth = 23.0
        self.tabBar.itemPositioning = .centered

    }
        
    override var traitCollection: UITraitCollection {
        let realTraits = super.traitCollection
        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
    }
    override func viewDidAppear(_ animated: Bool) {
//        self.tabBarController?.delegate = self

    }
    @objc(tabBarController:didSelectViewController:) func tabBarController(_ tabBarController: UITabBarController,
             didSelect viewController: UIViewController) {
            let tabBarIndex = tabBarController.selectedIndex
            if tabBarIndex == 1 {
              
             self.viewDidAppear(true)
                        
            }
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tabBar.frame = CGRect( x: 0, y: UIScreen.main.bounds.height - 100, width: self.view.frame.width, height: 80)

}
}
