//
//  ProductDetailsViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import Cosmos
class ProductDetailsViewController: UIViewController, Storyboarded, UITextViewDelegate {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRaiting: CosmosView!
    @IBOutlet weak var commentBottomView: UIView!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var priceLabe: UILabel!
    @IBOutlet weak var titleComment: SkyFloatingLabelTextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var initialLabel: UILabel!
    @IBOutlet weak var tableViewHeightConst: NSLayoutConstraint!
    //MARK:Properties
    var coordinator: ProductDetailsCoordinator?
    var viewModel: ProductDetailsViewModelProtocol?
    var product = [ProductDetails]()
    var offer = [OfferDetail]()
    var isOffer:Bool?
    var id:Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        globalData.isOffer = isOffer
        if isOffer == true{
            self.getOffer()
        }else{
            initialLabel.isHidden = true
            line.isHidden = true
            self.getProduct()
        }
        setupTitleComment()
        setupCommentView()
        setupTableView()
       
    }
    
    //MARK: - Functions
    func fillData(){
        let prod = product.first
        if let img = prod?.image{
        self.productImage.setImage(with: img)
        }
        self.productName.text = prod?.name ?? ""
        self.priceLabe.text = "\(prod?.price ?? "") CH"
        self.productRaiting.rating = Double(prod?.rating ?? 0 )
        if Language.language == Language.french{
            self.productDetails.text = prod?.desc_fr
        }else if Language.language == Language.german{
            self.productDetails.text = prod?.desc_de
        }else if Language.language == Language.italian{
            self.productDetails.text = prod?.desc_it
        }else{
            self.productDetails.text = prod?.desc_en
        }
        self.productRaiting.settings.updateOnTouch = false
        self.backButton.setTitle(prod?.name, for: .normal)
    }
    
    func fillOfferData(){
        let prod = offer.first
        if let img = prod?.image{
        self.productImage.setImage(with: img)
        }
        self.initialLabel.text = "\(prod?.initial_price ?? "") CH"
        self.priceLabe.text = "\(prod?.price ?? "") CH"
        self.productName.text = prod?.name ?? ""
        self.productRaiting.rating = Double(prod?.rating ?? 0 )
        if Language.language == Language.french{
            self.productDetails.text = prod?.desc_fr
        }else if Language.language == Language.german{
            self.productDetails.text = prod?.desc_de
        }else if Language.language == Language.italian{
            self.productDetails.text = prod?.desc_it
        }else{
            self.productDetails.text = prod?.desc_en
        }
        
        self.productRaiting.settings.updateOnTouch = false
        self.backButton.setTitle(prod?.name, for: .normal)
    }
    
   func setupTitleComment() {
        titleComment.placeholder = "Title *"
       titleComment.title = "Title *"
       titleComment.tintColor = Colors.lightGray
       titleComment.selectedTitleColor = Colors.lightGray
       titleComment.selectedLineColor = Colors.overcastBlueColor
       titleComment.lineHeight = 1.0 // bottom line height in points
       titleComment.selectedLineHeight = 2.0
    }

    func setupCommentView(){
        commentTextView.delegate = self
        commentTextView.textColor = Colors.lightGray
        commentTextView.text = "Comment..."
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        commentBottomView.backgroundColor = Colors.overcastBlueColor
        commentTextView.text = ""
        if commentTextView.textColor == Colors.lightGray {
            commentTextView.text = ""
            commentTextView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        commentBottomView.backgroundColor = Colors.lightGray
        if commentTextView.text == "" {
            commentTextView.text = "Comment..."
            commentTextView.textColor = Colors.lightGray
        }
    }
    
    func setupTableView(){
        self.commentTableView.rowHeight = 160
        self.commentTableView.estimatedRowHeight = UITableView.automaticDimension
        self.commentTableView.register(CommentCell.self)
        self.commentTableView.delegate = self.viewModel?.commentDataSource
        self.commentTableView.dataSource = self.viewModel?.commentDataSource
        
    }
    
    //API
    func getProduct(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getProductDetails(id:self.id ?? 0, completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count ?? 0 > 0{
                self.product = response ?? [ProductDetails]()
                self.viewModel?.getComments(comments: response?.first?.comments ?? [Comment]())
                print("comment:\(response?.first?.comments.reversed() ?? [Comment]())")
                dispatch {
                    self.commentTableView.reloadData()
                    self.view.layoutIfNeeded()
                    self.tableViewHeightConst.constant = self.commentTableView.contentSize.height
                     self.view.layoutIfNeeded()
                   
                }
                self.fillData()
            }
        })
    }
    
    func getOffer(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getOfferDetails(id:self.id ?? 0, completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count ?? 0 > 0{
                self.offer = response ?? [OfferDetail]()
                self.viewModel?.getOfferComments(comments: response?.first?.comments_offer ?? [CommentsOffer]())
                print("comment:\(response?.first?.comments_offer?.reversed() ?? [CommentsOffer]())")
                dispatch {
                    self.commentTableView.reloadData()
                    self.view.layoutIfNeeded()
                    self.tableViewHeightConst.constant = self.commentTableView.contentSize.height
                     self.view.layoutIfNeeded()
                   
                }
                self.fillOfferData()
            }
        })
    }
    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
    @IBAction func buyProductAction(_ sender: Any) {
        self.viewModel?.showWebView(url: product.first?.wp_product_url ?? "")
    }
    @IBAction func commentAction(_ sender: Any) {
        guard let title = titleComment.text, !title.isEmpty else {
            self.titleComment.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please write title!")
            return
        }
        if commentTextView.text == "Comment..." {
            self.commentTextView.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please write comment!")
            return
        }
        guard let comment = commentTextView.text, !comment.isEmpty else {
            self.commentTextView.becomeFirstResponder()
            self.showAlertWith(title: "Ajkune", message: "Please write comment!")
            return
        }
        addComment()
        commentTextView.text = ""
        titleComment.text = ""
        commentTextView.endEditing(true)
        titleComment.endEditing(true)
    }
    func addComment(){
        if isOffer == true{
            self.viewModel?.addOfferComment(product_id: String(offer.first?.id ?? 0), title: titleComment.text ?? "", comment: commentTextView.text, completion: { response in
                if response?.count != nil {
                    self.viewModel?.getOfferComments(comments: response?.first?.comments_offer ?? [CommentsOffer]())
                    dispatch {
                        self.commentTableView.reloadData()
                        self.view.layoutIfNeeded()
                        self.tableViewHeightConst.constant = self.commentTableView.contentSize.height
                        self.view.layoutIfNeeded()
                    }
                }
            })
        }else{
        self.viewModel?.addComment(product_id: String(product.first?.id ?? 0), title: titleComment.text ?? "", comment: commentTextView.text, completion: { response in
            if response?.count != nil {
                self.viewModel?.getComments(comments: response?.first?.comments.reversed() ?? [Comment]())
                print("comment:\(response?.first?.comments ?? [Comment]())")
                dispatch {
                    self.commentTableView.reloadData()
                    self.view.layoutIfNeeded()
                    self.tableViewHeightConst.constant = self.commentTableView.contentSize.height
                    self.view.layoutIfNeeded()
                }
            }
        })
    }
    }
    
}
    

extension ProductDetailsViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? ProductDetailsCoordinator
    }
}

