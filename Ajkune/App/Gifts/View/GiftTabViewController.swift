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
    //Properties
    var viewModel: GiftTabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        hasGifts()
    }
    
    func hasGifts(){
        self.viewModel?.hasGifts(completion: { response in
            if response?.userHasGift == true{
                self.giftView.isHidden = false
            }else{
                self.emptyView.isHidden = false
            }
        })
    }
    
//IBActions
    @IBAction func showGiftScreen(_ sender: Any) {
        self.viewModel?.showGiftScreen()
    }
}
