//
//  Loader.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

import UIKit
import NVActivityIndicatorView


private var activityRestorationIdentifier: String {
    return "NVActivityIndicatorViewContainer"
}

public func ShowLoaderWithMessage(message:String) {
    startActivityAnimating(size: CGSize(width:56, height:56), message: message, type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 2,isFromOnView: false)
}

public func SHOW_CUSTOM_LOADER() { //useing this
    startActivityAnimating(size: CGSize(width:56, height:56), message: nil, type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 2,isFromOnView: false)
}

public func SHOW_CUSTOM_LOADER_MSG(message: String) {
    startActivityAnimating(size: CGSize(width:56, height:56), message: message, type: .ballSpinFadeLoader, color: UIColor.white, padding: 2, isFromOnView: false)
    
}

public func HIDE_CUSTOM_LOADER() { //useing this
    stopActivityAnimating(isFromOnView: false)
}

public func ShowLoaderOnView() {
    startActivityAnimating(size: CGSize(width:56, height:56), message: nil, type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 2,isFromOnView: true)
}

public func HideLoaderOnView() {
    stopActivityAnimating(isFromOnView: true)
}

private func startActivityAnimating(size: CGSize? = nil, message: String? = nil, type: NVActivityIndicatorType? = nil, color: UIColor? = nil, padding: CGFloat? = nil, isFromOnView:Bool) {
    let activityContainer: UIView = UIView(frame: CGRect(x:0, y:0,width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height))
    activityContainer.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    activityContainer.restorationIdentifier = activityRestorationIdentifier

    activityContainer.isUserInteractionEnabled = false
    let actualSize = size ?? CGSize(width:56,height:56)
    
    let activityIndicatorView = NVActivityIndicatorView(
        frame: CGRect(x:0, y:0, width:actualSize.width, height:actualSize.height),
        type: type!,
        color:.lightGray,
        padding: padding!)
    
    activityIndicatorView.center = activityContainer.center
    activityIndicatorView.startAnimating()
    activityContainer.addSubview(activityIndicatorView)
    
    
    if message != nil {
        let width = activityContainer.frame.size.width / 2
        if let message = message , !message.isEmpty {
            let label = UILabel(frame: CGRect(x:0, y:0,width:width, height:30))
            label.center = CGPoint(
                x:activityIndicatorView.center.x, y:
                    activityIndicatorView.center.y + actualSize.height)
            label.textAlignment = .center
            label.text = message
            label.textColor = activityIndicatorView.color
            activityContainer.addSubview(label)
        }
    }
    UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
    if isFromOnView == true {
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(activityContainer)
    } else {
        UIApplication.shared.keyWindow?.addSubview(activityContainer)
    }
}

private func stopActivityAnimating(isFromOnView:Bool) {
    UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
    if isFromOnView == true {
        for item in (UIApplication.shared.keyWindow?.rootViewController?.view.subviews)!
        where item.restorationIdentifier == activityRestorationIdentifier {
            item.removeFromSuperview()
        }
    } else {
        if Reachability.isConnectedToNetwork() {
            do {
                for item in (UIApplication.shared.keyWindow?.subviews)!
                where item.restorationIdentifier == activityRestorationIdentifier {
                    item.removeFromSuperview()
                }
            }
        } else {
            print("There is not internet connection")
        }
    }
}
