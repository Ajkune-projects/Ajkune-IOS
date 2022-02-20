//
//  GiftTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import UIKit

class GiftTabViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var giftView: UIView!
    @IBOutlet weak var playLuckyWheelLBL: UILabel!
    @IBOutlet weak var giftTitleBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var emptyTitleLbl: UILabel!
    
    
    var viewModel: GiftTabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    override func viewDidAppear(_ animated: Bool) {
        hasGifts()
        localized ()
    }
    func localized (){
        emptyTitleLbl.text = "there_is_no_gift_for_you_at_the_moment".localized
        giftTitleBtn.setTitle("GiftTab".localized, for: .normal)
        playBtn.setTitle("play".localized, for: .normal)
        playLuckyWheelLBL.text = "play_lucky_wheel".localized
        
        
    }
    func hasGifts(){
        self.viewModel?.hasGifts(completion: { response in
            if response?.userHasGift == true{
                self.giftView.isHidden = false
                self.emptyView.isHidden = true
            }else{
                self.giftView.isHidden = true
                self.emptyView.isHidden = false
            }
        })
    }
    
//IBActions
    @IBAction func showGiftScreen(_ sender: Any) {
        self.viewModel?.showGiftScreen()
    }
}
