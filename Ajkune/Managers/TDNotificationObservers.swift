//
//  TDNotificationObservers.swift

//
//  Created by Djellza Rrustemi
//

import Foundation
import UIKit

extension Notification.Name {
    static var viewDismissed = Notification.Name.init("viewDismissed")
    static var updateMap = Notification.Name.init("updateMap")
    static var updateFilterEvents = Notification.Name.init("updateFilterEvents")
    static var updateOfferList = Notification.Name.init("updateOfferList")
    static var updateProfile = Notification.Name.init("updateProfile")
    static var updateOtherProfile = Notification.Name.init("updateOtherProfile")
    static var updateHomeData = Notification.Name.init("updateHomeData")
    static var activateHealthData = Notification.Name.init("activateHealthData")
    static var bravoPopUpDissmised = Notification.Name.init("bravoPopUpDissmised")
}

extension UIViewController {
    func registerNotification(notification name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    func postNotification(notification name: Notification.Name, object: Any?) {
        NotificationCenter.default.post(name: name, object: object)
    }
    func postNotification(notification name: Notification.Name, object: Any?, userInfo: [AnyHashable : Any]?) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    func removeNotifications(){
        NotificationCenter.default.removeObserver(self)
    }
}
