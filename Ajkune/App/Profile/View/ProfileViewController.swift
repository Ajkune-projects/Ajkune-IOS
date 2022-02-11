//
//  ProfileViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation
import UIKit
import TextFieldEffects
class ProfileViewController: UIViewController , Storyboarded, UITextFieldDelegate{
    @IBOutlet weak var genderOptionsView: UIView!
    @IBOutlet weak var firstNameTextfield: HoshiTextField!
    @IBOutlet weak var lastNameTextfield: HoshiTextField!
    @IBOutlet weak var chooseGender: HoshiTextField!
    @IBOutlet weak var birthdate: HoshiTextField!
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var phoneNumberTextfield: HoshiTextField!
    @IBOutlet weak var verifiedImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    
    //MARK: - Properties
    var viewModel: ProfileViewModelProtocol?
    var coordinator: ProfileCoordinator?
    var datePicker = UIDatePicker()
    var isOpen = false
    
    override func viewDidLoad() {
        setupFields()
        getUserDetails()
        setupLabel()
        genderOptionsView.shadowView()
        setupDatePicker()
    }
    override func viewDidAppear(_ animated: Bool) {
        setupLabel()
    }
    
    func setupFields(){
        chooseGender.delegate = self
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        birthdate.delegate = self
        emailTextField.delegate = self
        phoneNumberTextfield.delegate = self
        birthdate.addDoneButtonToKeyboard(myAction:  #selector(self.birthdate.resignFirstResponder))
        phoneNumberTextfield.addDoneButtonToKeyboard(myAction:  #selector(self.phoneNumberTextfield.resignFirstResponder))
    }
    
    func setupLabel(){
        if ProfileDetails.fullAddress == "" {
            addressLabel.text = "No added address yet!"
        }else{
            addressButton.setTitle("EDIT ADDRESS", for: .normal)
            addressLabel.text = ProfileDetails.fullAddress
        }
    }
    
    func setupDatePicker(){
        birthdate.inputView = datePicker
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged(datePicker:)), for: .valueChanged)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        birthdate.text = dateFormatter.string(from: datePicker.date)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == chooseGender {
            textField.endEditing(true)
            self.genderOptionsView.isHidden = false
            if isOpen == true {
                self.genderOptionsView.isHidden = true
                isOpen = false
                return
            }
            isOpen = true
        }
    }
    
    func getUserDetails(){
        self.viewModel?.getUserDetails(completion: { response in
            if response != nil {
                print(response)
            }
        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func femalePressed(_ sender: Any) {
        isOpen = false
        self.genderOptionsView.isHidden = true
        chooseGender.text = "Female"
    }
    @IBAction func malePressed(_ sender: Any) {
        isOpen = false
        self.genderOptionsView.isHidden = true
        chooseGender.text = "Male"
    }
    @IBAction func otherPressed(_ sender: Any) {
        isOpen = false
        self.genderOptionsView.isHidden = true
        chooseGender.text = "Other"
    }
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.stop()
    }
    @IBAction func showAddress(_ sender: Any) {
        self.viewModel?.showUserAddress()
    }
    
    
}
extension ProfileViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? ProfileCoordinator
    }
}
