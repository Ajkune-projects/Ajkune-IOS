//
//  TDNotificationObservers.swift

//
//  Created by Djellza Rrustemi
//

import Foundation
import UIKit

extension Notification.Name {
    static var viewDismissed = Notification.Name.init("viewDismissed")
    static var changeLang = Notification.Name.init("changeLang")
    static var UIKeyboardWillShow = Notification.Name.init("UIKeyboardWillShow")
    static var UIKeyboardWillHide = Notification.Name.init("UIKeyboardWillHide")

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
