//
//  WebViewViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
protocol WebViewViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : WebViewViewModelCoordinatorDelegate? {get set}
}
