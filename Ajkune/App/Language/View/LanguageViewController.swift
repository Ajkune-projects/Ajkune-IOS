//
//  LanguageViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation
import Foundation
import UIKit
import TextFieldEffects
class LanguageViewController: UIViewController , Storyboarded, UITextFieldDelegate{
    //MARK: - IBOutlets
    @IBOutlet weak var languageTextField: HoshiTextField!
    @IBOutlet weak var languageOptions: UIView!
    @IBOutlet weak var languageSubTitle: UILabel!
    @IBOutlet weak var titleButton: UIButton!
    
    //MARK: - Properties
    var viewModel: LanguageViewModelProtocol?
    var coordinator: LanguageCoordinator?
    var isOpen = false
    override func viewDidLoad() {
        self.languageTextField.delegate = self
        localize()
    }
    
    func localize(){
        languageTextField.text = "Language".localized
        languageTextField.placeholder = "Language_placeHolder".localized
        languageSubTitle.text = "Language_subtitle".localized
        titleButton.setTitle("TitleButton".localized, for: .normal)
    }
    
    
    //MARK: - IBActions

    @IBAction func englishLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "English"
        Language.language = Language.english
        self.postNotification(notification: Notification.Name.changeLang, object: nil)
        localize()
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
    @IBAction func germanLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "German"
        Language.language = Language.german
        self.postNotification(notification: Notification.Name.changeLang, object: nil)
        localize()
    }
    @IBAction func frenchLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "French"
        Language.language = Language.french
        self.postNotification(notification: Notification.Name.changeLang, object: nil)
        localize()
    }
    @IBAction func italianLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "Italian"
        Language.language =  Language.italian
        self.postNotification(notification: Notification.Name.changeLang, object: nil)
        localize()
    }
    //Functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == languageTextField {
           
            self.languageOptions.isHidden = false
            if isOpen == true {
                self.languageOptions.isHidden = true
                isOpen = false
                return
            }
            isOpen = true
            textField.endEditing(true)
        }
    }
    
    
}
extension LanguageViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? LanguageCoordinator
    }
}
