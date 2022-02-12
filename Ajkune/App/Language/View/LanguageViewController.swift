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
    
    //MARK: - Properties
    var viewModel: LanguageViewModelProtocol?
    var coordinator: LanguageCoordinator?
    var isOpen = false
    
    override func viewDidLoad() {
        self.languageTextField.delegate = self
    }
    //MARK: - IBActions
    
    @IBAction func englishLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "English"
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
    @IBAction func germanLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "German"
    }
    @IBAction func albanianLangPressed(_ sender: Any) {
        isOpen = false
        self.languageOptions.isHidden = true
        languageTextField.text = "Albania"
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
