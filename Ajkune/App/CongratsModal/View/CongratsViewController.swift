//
//  CongratsViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/15/22.
//
import Foundation
import UIKit
import TextFieldEffects
class CongratsViewController: UIViewController, Storyboarded {
    
    //MARK: IBOutlets
    @IBOutlet var mainContainerView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var giftDesc: UILabel!
    @IBOutlet weak var giftImage: UIImageView!
    //MARK: - Properties
    var coordinator: CongratsCoordinator?
    var viewModel: CongratsViewModelProtocol?
    var giftDetails:GiftListElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fillData()
    }
    
    //MARK:Functions
    func setupView(){
        self.mainView.layer.masksToBounds = false
//        self.mainView.layer.shadowRadius = 4
//        self.mainView.layer.shadowOpacity = 0.8
//        self.mainView.layer.shadowColor = UIColor.lightGray.cgColor
//        self.mainView.layer.shadowOffset = CGSize(width: 0 , height:3)
        
        mainContainerView.alpha = 0.7
        mainContainerView.effect = UIBlurEffect(style: .light)
        
    }

    func fillData(){
        giftDesc.text = "Congratulations you have win : \(giftDetails?.giftListDescription ?? "").For more details please contact in this email: ajkune.professional@gmail.com"
        giftImage.setImage(with: giftDetails?.imageURL ?? "")
    }
    
    //MARK: - IBOutlets
    
    @IBAction func closebuttonAction(_ sender: Any) {
        self.coordinator?.stop()
    }
}

//MARK : BNCoordinated
extension CongratsViewController : TDCoordinated {
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? CongratsCoordinator
    }
}

