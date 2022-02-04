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
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
                tabBar.layer.shadowOpacity = 0.2
                tabBar.layer.shadowOffset = CGSize.zero
                tabBar.layer.shadowRadius = 5
                self.tabBar.layer.borderColor = UIColor.clear.cgColor
                self.tabBar.layer.cornerRadius = 5
                self.tabBar.clipsToBounds = false
                self.tabBar.backgroundColor = UIColor.white
                UITabBar.appearance().shadowImage = UIImage()
                UITabBar.appearance().backgroundImage = UIImage()
        self.tabBar.layer.insertSublayer(layer, at: 0)
        if let items = self.tabBar.items {
            items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            let color = UIColor(red: 0.66, green: 0.27, blue: 0.44, alpha: 1.00)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: color], for: .selected)

//        self.tabBar.itemWidth = 23.0
        self.tabBar.itemPositioning = .centered

    }
        
//    override var traitCollection: UITraitCollection {
//        let realTraits = super.traitCollection
//        let lieTrait = UITraitCollection.init(horizontalSizeClass: .regular)
//        return UITraitCollection(traitsFrom: [realTraits, lieTrait])
//    }
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
        self.tabBar.frame = CGRect( x: 0, y: UIScreen.main.bounds.height - 80, width: self.view.frame.width, height: 80)

}
}
