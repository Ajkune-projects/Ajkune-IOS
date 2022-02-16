//
//  AppointmentTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import UIKit
import WebKit
import Foundation

class AppointmentTabViewController: UIViewController, WKUIDelegate,Storyboarded {
    
    @IBOutlet weak var mainView: UIView!
    //Properties
    var viewModel: AppointmentTabViewModelProtocol?
    var coordinator: AppointmentTabCoordinator?
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
        var responseUrl : String = "https://connect.shore.com/bookings/ajkune-professional-spreitenbach-nbz/locations?locale=en-CH"
        override func viewDidLoad() {
            super.viewDidLoad()
            SHOW_CUSTOM_LOADER()
            setupUI()
            let myURL = URL(string: (responseUrl))
            let myRequest = URLRequest(url: myURL ?? URL(fileURLWithPath: "") )
            webView.load(myRequest)
        }
        
    @IBAction func backPressed(_ sender: Any) {
        if webView.canGoBack {
                webView.goBack()
            }
    }
        func setupUI() {
//            self.view.backgroundColor = .white
            self.mainView.addSubview(webView)
//            self.w
            
            NSLayoutConstraint.activate([
                webView.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.rightAnchor)
            ])
            HIDE_CUSTOM_LOADER()
        }
    
}
extension AppointmentTabViewController : TDCoordinated {

    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }

    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? AppointmentTabCoordinator
    }
}


