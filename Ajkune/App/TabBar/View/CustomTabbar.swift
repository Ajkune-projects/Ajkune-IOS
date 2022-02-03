//
//  CustomTabbar.swift

//
//  Created by Djellza Rrustemi
//

import UIKit
class CustomTabBar: UITabBar {

    let roundedView = UIView(frame: .zero)

    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView.backgroundColor = .red
//        roundedView.layer.borderWidth = 2.0
        
        roundedView.layer.cornerRadius = 18
//        roundedView.clipsToBounds = true
//        roundedView.layer.masksToBounds = false
//        roundedView.layer.shadowRadius = 2
//        roundedView.layer.shadowOpacity = 1
//        roundedView.layer.shadowOffset = CGSize(width: 2, height: 2)
        roundedView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        roundedView.isUserInteractionEnabled = false
     //   roundedView.layer.borderColor = UIColor.black.cgColor
        self.addSubview(roundedView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let position = CGPoint(x: 0, y: 0)
        let size = CGSize(width: self.frame.width, height: self.frame.height)
        roundedView.frame = CGRect(origin: position, size: size)
    }
}
