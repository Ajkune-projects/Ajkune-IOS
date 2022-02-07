//
//  WebViewCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit

class WebViewCoordinator: TDPushCoordinator{
    var configuration: ((WebViewViewController) -> ())?
    var viewController : WebViewViewController?
    var navigationController: UINavigationController?
    var viewModel : WebViewViewModelProtocol
    
    init(viewModel: WebViewViewModelProtocol, navigationController:UINavigationController?, responseUrl:String) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = WebViewViewController.instantiate(.webView)
        self.viewController?.responseUrl = responseUrl
        self.viewController?.viewModel = viewModel
    }
}
