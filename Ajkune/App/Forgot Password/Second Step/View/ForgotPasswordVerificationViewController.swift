//
//  ForgotPasswordViewController.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
import UIKit
import PinCodeInputView
class ForgotPasswordVerificationViewController: UIViewController, Storyboarded {
    @IBOutlet weak var forgotPassTitle: UILabel!
    @IBOutlet weak var enterEmailDesc: UILabel!
    @IBOutlet weak var enterCodeDesc: UILabel!
    
    //MARK:Properties
    var coordinator: ForgotPasswordVerificationCoordinator?
    var viewModel: ForgotPasswordVerificationViewModelProtocol?
    let pinCodeInputView: PinCodeInputView<UnderlineItemView> = .init(
        digit: 5,
        itemSpacing: 10,
        itemFactory: {
            return UnderlineItemView()
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addObservers()
        forgotPassTitle.text = "forgot_password".localized
        enterEmailDesc.text = "email_address_verification".localized
        enterCodeDesc.text = "enter_the_code_you_came_from_to_receive_by_email".localized
        
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    
    @objc func updateLang(notification: Notification) {
        forgotPassTitle.text = "forgot_password".localized
        enterEmailDesc.text = "email_address_verification".localized
        enterCodeDesc.text = "enter_the_code_you_came_from_to_receive_by_email".localized
        
    }
    //MARK: - Functions
    func setupUI(){
        self.setupPINCodeView()
    }

    func setupPINCodeView(){
        view.addSubview(pinCodeInputView)
        pinCodeInputView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 56, height: 80)
        pinCodeInputView.center = view.center
        pinCodeInputView.set(changeTextHandler: { text in
            if text.count == 5{
                self.pinCodeInputView.resignFirstResponder()
                forgotPassword.resetCode = text
                self.requestConfirmation(confirmationCode: text)

            }
        })
        pinCodeInputView.set(
            appearance: .init(
                itemSize: CGSize(width: 40, height: 35),
                font:.systemFont(ofSize: 22, weight: .medium),
                textColor: UIColor.black,
                backgroundColor: UIColor.black,
                cursorColor: .black,
                cornerRadius: 0
            )
        )
        addGesture()
    }

    func addGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func tap() {
        pinCodeInputView.resignFirstResponder()
    }
    @objc func didBecameActive() {
        if let string = UIPasteboard.general.string {
            pinCodeInputView.set(text: string)
        }
    }
    //API
    func requestConfirmation(confirmationCode: String){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.checkResetPasswordCode(resetPasswordCode: confirmationCode, completion: { (response) in
            HIDE_CUSTOM_LOADER()
            if response?.success == true{
                self.viewModel?.showResetPassword()
                forgotPassword.resetCode = confirmationCode
            }
            else{
                self.pinCodeInputView.becomeFirstResponder()
//                self.pinCodeInputView.deleteAll()
                self.showAlertWith(title: "OUPS !", message: response?.message ?? "We're having a problem.\nPlease try again in a few minutes ! ")
            }
        })
    }

    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
}
    

extension ForgotPasswordVerificationViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? ForgotPasswordVerificationCoordinator
    }
}
