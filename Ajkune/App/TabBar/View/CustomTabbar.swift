//
//  CustomTabbar.swift

//
//  Created by Djellza Rrustemi
//

import UIKit
@IBDesignable class TabBarWithCorners: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 16
    private var shapeLayer: CALayer?
    var tabbar:UITabBar?
    let centerButton = UIButton(frame: CGRect(x: 0, y: 10, width: 70, height: 70))
    override func draw(_ rect: CGRect) {
        addShape()
        setupCenterButton()
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?
    {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed()
        {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event)
            else { continue }
            return result
        }
        return nil
    }
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.darkGray.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0  , height: -2);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    func setupCenterButton() {
        var centerButtonFrame = centerButton.frame
//        if UIDevice.current.screenType == .iPhones_6_6s_7_8 {
//        centerButtonFrame.origin.y = (self.bounds.height - centerButtonFrame.height)
//        }else if UIDevice.current.screenType == .iPhones_6Plus_6sPlus_7Plus_8Plus {
//            centerButtonFrame.origin.y = (self.bounds.height - centerButtonFrame.height)-10
//        }else{
            centerButtonFrame.origin.y = (self.bounds.height - centerButtonFrame.height) - 40
//        }
        centerButtonFrame.origin.x = self.bounds.width/2 - centerButtonFrame.size.width/2
        centerButton.frame = centerButtonFrame
        
        centerButton.layer.cornerRadius = 35
        self.addSubview(centerButton)
        
        centerButton.setBackgroundImage(#imageLiteral(resourceName: "middleButton"), for: .normal)
        centerButton.addTarget(self, action: #selector(centerButtonAction(sender:)), for: .touchUpInside)
        
        self.layoutIfNeeded()
    }
    @objc private func centerButtonAction(sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.tab, object: nil)
    }
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))
        return path.cgPath
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame      = self.frame
        tabFrame.size.height  = 55 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y    = self.frame.origin.y +  ( self.frame.height - 55 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame      = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }
    
}

















