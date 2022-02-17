//
//  OfferTabViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation
import UIKit
class OfferTabViewController: UIViewController, Storyboarded{
    
    //MARK: - Properties
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var bannerTitle: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var initialPrice: UILabel!
    @IBOutlet weak var tableViewHeightConst: NSLayoutConstraint!
    
    var viewModel: OfferTabViewModelProtocol?
    var categoryID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupProductsCollectionView()
        filterData()
        getALLProducts()
        getBanner()
        globalData.filterFromOffer = true
    }
    override func viewWillAppear(_ animated: Bool) {
        filterData()
    }
    override func viewDidAppear(_ animated: Bool) {
        globalData.filterFromOffer = true
    }
    func filterData(){
        if globalData.fromFilter == true{
            self.viewModel?.getALLProducts(products: globalData.filteredProducts)
            if globalData.filteredProducts.count == 0 {
                self.productsCollectionView.reloadData()
                self.tableViewHeightConst.constant = 300
            }else{
                self.productsCollectionView.reloadData()
                self.view.layoutIfNeeded()
                self.tableViewHeightConst.constant = self.productsCollectionView.contentSize.height
                self.view.layoutIfNeeded()
            }
        }
        globalData.fromFilter = false
    }
    func setupProductsCollectionView(){
        self.productsCollectionView.register(OfferProductCell.self)
        self.productsCollectionView.delegate = self.viewModel?.productDataSource
        self.productsCollectionView.dataSource = self.viewModel?.productDataSource
        self.productsCollectionView.emptyDataSetSource = self.viewModel?.productDataSource
        self.productsCollectionView.emptyDataSetDelegate = self.viewModel?.productDataSource
        productsCollectionView.emptyDataSetView { [weak self] view in
            view.customView(ProductsEmptyView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))).verticalOffset(-50)
        }
    }
    
    func getALLProducts(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getALLProducts(completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                self.viewModel?.getALLProducts(products: response)
                dispatch {
                    self.productsCollectionView.reloadData()
                    self.view.layoutIfNeeded()
                    self.tableViewHeightConst.constant = self.productsCollectionView.contentSize.height
                    self.view.layoutIfNeeded()
                }
            }
        })
    }
    func getCategoryByID (id:Int){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getProductsByID(id: id, completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                self.viewModel?.getALLProducts(products: response)
                dispatch {
                    self.productsCollectionView.reloadData()
                    self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPathOffer, animated: false, scrollPosition: .top)
                    self.categoryCollectionView.scrollToItem(at: globalData.categoryIndexPathOffer, at: .centeredHorizontally, animated: true)
                }
            }
        })
    }
    
    
    func getBanner(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getBanner(completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                self.banner.setImage(with: response?.first?.image_path ?? "")
                self.bannerTitle.text = response?.first?.title ?? ""
                self.priceLabel.text = response?.first?.price ?? ""
                self.initialPrice.text = response?.first?.initial_price ?? ""
            }
        })
    }
    
    @IBAction func filterProducts(_ sender: Any) {
        self.viewModel?.filterProducts()
    }
    
}
extension OfferTabViewController: OfferTabViewModelViewDelegate{
    func productDetails(id: Int) {
        self.viewModel?.showProductDetails(id: id)
    }
    
}
