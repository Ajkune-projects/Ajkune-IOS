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
 
    var viewModel: AppointmentTabViewModelProtocol?
    var coordinator: AppointmentTabCoordinator?
    var lang:String?
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
   
    var responseUrl : String?
        override func viewDidLoad() {
            super.viewDidLoad()
            SHOW_CUSTOM_LOADER()
            setupUI()
            setupWebView()
            addObservers()
        }
        
    @IBAction func backPressed(_ sender: Any) {
        if webView.canGoBack {
                webView.goBack()
            }
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    @objc func updateLang(notification: Notification) {
        setupWebView()
        setupUI()
    }
    
    func setupWebView(){
        responseUrl = "https://connect.shore.com/bookings/ajkune-professional-spreitenbach-nbz/locations?locale=\("lang".localized)-CH"
        let myURL = URL(string: (responseUrl ?? ""))
        let myRequest = URLRequest(url: myURL ?? URL(fileURLWithPath: "") )
        webView.load(myRequest)
    }
    
        func setupUI() {
            self.mainView.addSubview(webView)
            
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


