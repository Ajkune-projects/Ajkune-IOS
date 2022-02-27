//
//  GiftTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import UIKit

class GiftTabViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var giftView: UIView!
    @IBOutlet weak var playLuckyWheelLBL: UILabel!
    @IBOutlet weak var giftTitleBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var emptyTitleLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var heightLoginBtn: NSLayoutConstraint!
    
    
    var viewModel: GiftTabViewModelProtocol?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        playBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    override func viewDidAppear(_ animated: Bool) {
        hasGifts()
        localized ()
    }
    func localized (){
        if UserDefaults.standard.value(forKey: "USER_TOKEN") as! String == globalData.defaultToken {
            emptyTitleLbl.text = "premissions_gifts".localized
            heightLoginBtn.constant = 37
            loginBtn.isHidden = false
            loginBtn.setTitle("login_register".localized, for: .normal)
        }else{
        emptyTitleLbl.text = "there_is_no_gift_for_you_at_the_moment".localized
            heightLoginBtn.constant = 0
            loginBtn.isHidden = true
        }
        giftTitleBtn.setTitle("GiftTab".localized, for: .normal)
        playBtn.setTitle("play".localized, for: .normal)
        playLuckyWheelLBL.text = "play_lucky_wheel".localized
        
    }
    
    func refresh(){
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.scrollView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.hasGifts()
            
        }
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
            self.refreshControl.endRefreshing()
        })
    }
    
//IBActions
    @IBAction func showGiftScreen(_ sender: Any) {
        self.viewModel?.showGiftScreen()
    }
    @IBAction func loginOrRegister(_ sender: Any) {
        Account.shared.clear()
    }
}
