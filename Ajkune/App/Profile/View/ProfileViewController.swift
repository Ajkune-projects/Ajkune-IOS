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
    
    //MARK: - Properties
    var viewModel: ProfileViewModelProtocol?
    var coordinator: ProfileCoordinator?
    var datePicker = UIDatePicker()
    var isOpen = false
    var choosenImg: UIImage?
    var profilePic:String?
    
    override func viewDidLoad() {
        setupFields()
        setupLabel()
        getUserDetails()
        genderOptionsView.shadowView()
        setupDatePicker()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        userImage.addGestureRecognizer(tap)
        userImage.isUserInteractionEnabled = true
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
            addressButton.setTitle("ADD ADDRESS", for: .normal)
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
                ProfileDetails.zipCode = "\(response?.user?.zip_code ?? 0)"
                ProfileDetails.country = response?.user?.country ?? ""
                ProfileDetails.fullAddress = "\(response?.user?.street ?? "") \n\(response?.user?.address ?? "")\n\(response?.user?.zip_code ?? 0 )\n\(response?.user?.country ?? "")"
                self.addressLabel.text = ProfileDetails.fullAddress
                if response?.user?.image_name != ""{
                    self.userImage.borderColor = UIColor(hexString: "#FFD700")
                    self.verifiedImage.isHidden = false
                }
            }
        })
    }
    
    func saveUserDetails(){
        let user = UserProfile(name: firstNameTextfield.text ?? "", last_name: lastNameTextfield.text ?? "", gender: chooseGender.text ?? "", date_of_birth: birthdate.text ?? "", phone: phoneNumberTextfield.text ?? "", address:ProfileDetails.city, street: ProfileDetails.street, zip_code: ProfileDetails.zipCode, country: ProfileDetails.country, base64_img: profilePic)
        self.viewModel?.verificationProfile(user: user, completion: { response in
            if response != nil{
                if response?.user?.image_name != ""{
                    self.userImage.borderColor = UIColor(hexString: "#FFD700")
                    self.verifiedImage.isHidden = false
                }
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
    
    @IBAction func saveUserDetails(_ sender: Any) {
        saveUserDetails()
    }

    @objc func tappedMe() {
        let editPicture = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let removePicture = UIAlertAction(title: "Remove photo", style: .default, handler: {
              (alert: UIAlertAction!) -> Void in self.deleteProfilePicture() })
        let takeApicture = UIAlertAction(title: "Take a picture", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in self.openCamera() })
        let chooseFromCameraRoll = UIAlertAction(title:"Choose from gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in self.openPhotoLibraryButton() })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in })
        editPicture.addAction(removePicture)
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
