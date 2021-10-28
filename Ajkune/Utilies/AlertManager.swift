//
//  AlertManager.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 26.10.21..
//

import Foundation
import UIKit

typealias ActionHandler = () -> Void

struct AlertActions {
    static let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)

    static let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

    static func delete(_ handler: @escaping ActionHandler) -> UIAlertAction {
        return UIAlertAction(title: "Delete", style: .destructive, handler: { _ in handler() })
    }

    static func genericConfirm(title: String, _ handler: @escaping ActionHandler) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default, handler: { _ in handler() })
    }

    static let no = UIAlertAction(title: "No", style: .cancel, handler: nil)

    static func yes(_ handler: @escaping ActionHandler) -> UIAlertAction {
        return UIAlertAction(title: "Yes", style: .destructive, handler: { _ in handler() })
    }
}

extension UIViewController {
    private func showAlert(title: String?, message: String?, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alertController.addAction($0) }
        present(alertController, animated: true, completion: nil)
    }

    private func actionSheet(
        title: String?,
        message: String?,
        options: [String],
        completion: @escaping (Int) -> Void
    ) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction(title: option, style: .default, handler: { _ in
                completion(index)
            }))
        }
        alertController.addAction(AlertActions.cancel)
        return alertController
    }

    private func showActionSheet(
        title: String?,
        message: String?,
        options: [String],
        completion: @escaping (Int) -> Void
    ) -> UIAlertController {
        return actionSheet(title: title, message: message, options: options, completion: completion)
    }

    // MARK: Custom alerts
    func showErrorAlert(message: String) {
        showAlert(title: "Error", message: message, actions: [AlertActions.dismiss])
    }

    func showConfirmalert(message: String, confirmAction: @escaping ActionHandler) {
        showAlert(title: "Confirm", message: message, actions: [AlertActions.no, AlertActions.yes(confirmAction)])
    }
}
