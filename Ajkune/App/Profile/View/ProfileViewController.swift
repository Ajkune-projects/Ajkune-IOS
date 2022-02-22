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
    @IBOutlet weak var userImage: UIImageView!
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
    @IBOutlet weak var profileTitle: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    //MARK: - Properties
    var viewModel: ProfileViewModelProtocol?
    var coordinator: ProfileCoordinator?
    var datePicker = UIDatePicker()
    var isOpen = false
    var choosenImg: UIImage?
    var profilePic:String?
    var isActive:Int?
    
    override func viewDidLoad() {
        setupFields()
        setupLabel()
        getUserDetails()
        genderOptionsView.shadowView()
        setupDatePicker()
        rightImageView()
        localize()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        userImage.addGestureRecognizer(tap)
        userImage.isUserInteractionEnabled = true
    }
    override func viewDidAppear(_ animated: Bool) {
        setupLabel()
    }
    
    func localize(){
        profileTitle.setTitle("profile".localized, for: .normal)
        saveBtn.setTitle("save".localized, for: .normal)
        firstNameTextfield.placeholder = "first_name".localized
        lastNameTextfield.placeholder = "last_name".localized
        chooseGender.placeholder = "choose_gender".localized
        birthdate.placeholder = "choose_date".localized
        phoneNumberTextfield.placeholder = "phone_number".localized
        femaleBtn.setTitle("female".localized, for: .normal)
        maleBtn.setTitle("male".localized, for: .normal)
        otherBtn.setTitle("other".localized, for: .normal)
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
            addressLabel.text = "no_added_address_yet".localized
            addressButton.setTitle("add_your_address".localized.uppercased(), for: .normal)
        }else{
            addressButton.setTitle("edit_your_address".localized.uppercased(), for: .normal)
            addressLabel.text = ProfileDetails.fullAddress
        }
    }
    
    func rightImageView(){
        let calendar = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        calendar.setImage(UIImage(named: "calendar"), for: UIControl.State())
        let container = UIView(frame: calendar.frame)
        container.addSubview(calendar)
        birthdate.rightView = container
        birthdate.rightViewMode = .always
        
        let phone = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 15))
        phone.setImage(UIImage(named: "phone"), for: UIControl.State())
        let containerPhone = UIView(frame: phone.frame)
        containerPhone.addSubview(phone)
        phoneNumberTextfield.rightView = containerPhone
        phoneNumberTextfield.rightViewMode = .always
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
        dateFormatter.dateFormat = "yyy-MM-dd"
        birthdate.text = dateFormatter.string(from: datePicker.date)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == chooseGender {
           
            self.genderOptionsView.isHidden = false
            if isOpen == true {
                self.genderOptionsView.isHidden = true
                isOpen = false
                return
            }
            isOpen = true
            textField.endEditing(true)
        }
    }
    
    func getUserDetails(){
        self.viewModel?.getUserDetails(completion: { response in
            if response != nil {
                self.firstNameTextfield.text = response?.user?.name
                self.lastNameTextfield.text = response?.user?.last_name
                self.chooseGender.text = response?.user?.gender
                self.birthdate.text = response?.user?.date_of_birth
                self.emailTextField.text = response?.user?.email
                self.phoneNumberTextfield.text = response?.user?.phone
                self.userImage.setImage(with: response?.user?.image_name ?? "")
                self.nameLabel.text = "\(response?.user?.name ?? "") \(response?.user?.last_name ?? "")"
//                self.addressLabel.text = response?.address
                ProfileDetails.street = response?.user?.street ?? ""
                ProfileDetails.city = response?.user?.address ?? ""
//                ProfileDetails.zipCode = "\(== nil ? nil : response?.user?.zip_code)"
                if response?.user?.zip_code == nil ||  response?.user?.zip_code == 0{
                    ProfileDetails.zipCode = ""
                }else{
                    ProfileDetails.zipCode = "\(String(describing: response?.user?.zip_code))"
                }
                ProfileDetails.country = response?.user?.country ?? ""
                ProfileDetails.fullAddress = "\(response?.user?.street ?? "") \n\(response?.user?.address ?? "")\n\(ProfileDetails.zipCode ?? "")\n\(response?.user?.country ?? "")"
                if response?.user?.street == nil && response?.user?.zip_code  == nil && response?.user?.address == nil {
                    ProfileDetails.fullAddress = ""
                }
                self.addressLabel.text = ProfileDetails.fullAddress
               
                self.isActive = response?.user?.active_profile
                if response?.user?.active_profile == 1{
                    self.userImage.borderColor = UIColor(hexString: "#FFD700")
                    self.verifiedImage.isHidden = false
                }
                self.setupLabel()
            }
        })
    }
    
    func saveUserDetails(){
        let user = UserProfile(name: firstNameTextfield.text ?? "", last_name: lastNameTextfield.text ?? "", gender: chooseGender.text ?? "", date_of_birth: birthdate.text ?? "", phone: phoneNumberTextfield.text ?? "", address:ProfileDetails.city, street: ProfileDetails.street, zip_code: ProfileDetails.zipCode, country: ProfileDetails.country, base64_img: profilePic)
        SHOW_CUSTOM_LOADER()
        self.viewModel?.verificationProfile(user: user, completion: { response in
            if response != nil{
                HIDE_CUSTOM_LOADER()
                if response?.user?.active_profile == 1{
                    self.userImage.borderColor = UIColor(hexString: "#FFD700")
                    self.nameLabel.text = "\(response?.user?.name) \(response?.user?.last_name)"
                    self.verifiedImage.isHidden = false
                }
                self.showOKAlert(title: "Ajkune", message: "data_saved_successfully".localized)
            }else{
                self.showOKAlert(title: "Error", message: "Error")
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
        chooseGender.text = "female".localized
    }
    @IBAction func malePressed(_ sender: Any) {
        isOpen = false
        self.genderOptionsView.isHidden = true
        chooseGender.text = "male".localized
    }
    @IBAction func otherPressed(_ sender: Any) {
        isOpen = false
        self.genderOptionsView.isHidden = true
        chooseGender.text = "other".localized
    }
    @IBAction func backPressed(_ sender: Any) {
        coordinator?.stop()
    }
    @IBAction func showAddress(_ sender: Any) {
        self.viewModel?.showUserAddress()
    }
    
    @IBAction func saveUserDetails(_ sender: Any) {
        if self.isActive == 0 && profilePic == nil{
            self.showAlertWith(title: "Ajkune", message: "Please add your profile photo!")
            return
        }
        saveUserDetails()
    }

    @objc func tappedMe() {
        let editPicture = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        let removePicture = UIAlertAction(title: "Remove photo", style: .default, handler: {
//              (alert: UIAlertAction!) -> Void in self.deleteProfilePicture() })
        let takeApicture = UIAlertAction(title: "take_photo".localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in self.openCamera() })
        let chooseFromCameraRoll = UIAlertAction(title:"choose_from_gallery".localized, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in self.openPhotoLibraryButton() })
        let cancelAction = UIAlertAction(title: "cancel".localized, style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in })
//        editPicture.addAction(removePicture)
        editPicture.addAction(takeApicture)
        editPicture.addAction(chooseFromCameraRoll)
        editPicture.addAction(cancelAction)
        editPicture.view.tintColor = Colors.overcastBlueColor
        
        if let popoverController = editPicture.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: 0, y: view.frame.size.height, width: self.view.frame.size.width, height: 200)
        }
        self.present(editPicture, animated: true, completion: nil)
    }

    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
          let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
          self.choosenImg = image
          //base64
          let imageData = image.jpegData(compressionQuality: 0.2)
          let imageBase64String = imageData?.base64EncodedString()
            self.userImage.image = self.choosenImg
            self.profilePic = imageBase64String ?? ""
        }
        picker.dismiss(animated: true, completion: {
        })
      }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func deleteProfilePicture(){
        let defaultImage = UIImage(named: "Avatar")
        self.choosenImg = defaultImage
        //base64
        let imageData = defaultImage?.pngData()
        let imageBase64String = imageData?.base64EncodedString()
        self.userImage.image = self.choosenImg
        self.profilePic = imageBase64String ?? ""
        
    }
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)

        }
    }

    
    func openPhotoLibraryButton() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
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
