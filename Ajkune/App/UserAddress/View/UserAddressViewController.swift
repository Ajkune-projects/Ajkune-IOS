//
//  UserAddressViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/11/22.
//

import UIKit
import TextFieldEffects

class UserAddressViewController: UIViewController, Storyboarded {
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var streetTextfield: HoshiTextField!
    @IBOutlet weak var cityTextfield: HoshiTextField!
    @IBOutlet weak var zipCodeTextfield: HoshiTextField!
    @IBOutlet weak var countryTextfield: HoshiTextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    //MARK: - Properties
    var viewModel: UserAddressViewModelProtocol?
    var coordinator: UserAddressCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        streetTextfield.text = ProfileDetails.street
        cityTextfield.text = ProfileDetails.city
        zipCodeTextfield.text = ProfileDetails.zipCode
        countryTextfield.text = ProfileDetails.country
        if ProfileDetails.fullAddress == "" {
            titleButton.setTitle("add_your_address".localized, for: .normal)
        }else{
            titleButton.setTitle("edit_your_address".localized, for: .normal)
        }
        saveBtn.setTitle("save".localized, for: .normal)
        streetTextfield.placeholder = "street".localized
        cityTextfield.placeholder = "city".localized
        zipCodeTextfield.placeholder = "zip_code".localized
        countryTextfield.placeholder = "country".localized
    }
    
    func validateTextfields(){
            guard let street = streetTextfield.text, !street.isEmpty else {
                self.streetTextfield.becomeFirstResponder()
                self.showAlertWith(title: "Ajkune", message: "fill_required_fields".localized)
                return
            }
        guard let city = cityTextfield.text, !city.isEmpty else {
            self.cityTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "fill_required_fields".localized)
            return
        }
        guard let zipCode = zipCodeTextfield.text, !zipCode.isEmpty else {
            self.zipCodeTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "fill_required_fields".localized)
            return
        }
        guard let country = countryTextfield.text, !country.isEmpty else {
            self.countryTextfield.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "fill_required_fields".localized)
            return
        }
        ProfileDetails.street = streetTextfield.text ?? ""
        ProfileDetails.city = cityTextfield.text ?? ""
        ProfileDetails.zipCode = zipCodeTextfield.text ?? ""
        ProfileDetails.country = countryTextfield.text ?? ""
        ProfileDetails.fullAddress = "\(streetTextfield.text ?? "") \n\(cityTextfield.text ?? "")\n\(zipCodeTextfield.text ?? "")\n\(countryTextfield.text ?? "")"
        if ProfileDetails.street == "" && ProfileDetails.city == "" && ProfileDetails.zipCode == "" && ProfileDetails.country == ""{
            ProfileDetails.fullAddress = ""
        }
        coordinator?.stop()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.stop()
    }
    @IBAction func savePressed(_ sender: Any) {
        validateTextfields()
    }
    
}
extension UserAddressViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? UserAddressCoordinator
    }
}
