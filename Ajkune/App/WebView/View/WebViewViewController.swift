//
//  WebViewViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit
import WebKit
class WebViewViewController: UIViewController,WKUIDelegate, Storyboarded {
    
    //MARK:Properties
    var coordinator: WebViewCoordinator?
    var viewModel: WebViewViewModelProtocol?
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var responseUrl : String = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let myURL = URL(string: (responseUrl))
        let myRequest = URLRequest(url: myURL ?? URL(fileURLWithPath: "") )
        webView.load(myRequest)
    }
    
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
}



extension WebViewViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? WebViewCoordinator
    }
}


