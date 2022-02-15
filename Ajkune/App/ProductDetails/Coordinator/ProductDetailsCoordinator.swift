//
//  ProductDetailsCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit

class ProductDetailsCoordinator: TDPushCoordinator{
    var configuration: ((ProductDetailsViewController) -> ())?
    var viewController : ProductDetailsViewController?
    var navigationController: UINavigationController?
    var viewModel : ProductDetailsViewModelProtocol
    var webViewCoordinator: WebViewCoordinator?
    
    init(viewModel: ProductDetailsViewModelProtocol, navigationController:UINavigationController?, id:Int,isOffer:Bool) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ProductDetailsViewController.instantiate(.productDetails)
        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
        self.viewController?.isOffer = isOffer
    }
}

extension ProductDetailsCoordinator:ProductDetailsViewModelCoordinatorDelegate{
    func showWebView(url: String) {
        webViewCoordinator = WebViewCoordinator(viewModel:WebViewViewModel(), navigationController: self.viewController?.navigationController, responseUrl: url)
        webViewCoordinator?.start()
    }
}
