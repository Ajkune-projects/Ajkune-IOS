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
//        roundedView.backgroundColor = .red
        roundedView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        roundedView.isUserInteractionEnabled = false
        self.tintColor = Colors.overcastBlueColor
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
