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
    
    var viewModel: OfferTabViewModelProtocol?
    var categoryID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupProductsCollectionView()
        filterData()
        getALLProducts()
        getBanner()
    }
    override func viewWillAppear(_ animated: Bool) {
        filterData()
    }
    func filterData(){
        if globalData.fromFilter == true{
            self.viewModel?.getALLProducts(products: globalData.filteredProducts)
            dispatch {
                self.productsCollectionView.reloadData()
            }
        }
        globalData.fromFilter = false
    }
    func setupProductsCollectionView(){
        self.productsCollectionView.register(OfferProductCell.self)
        self.productsCollectionView.delegate = self.viewModel?.productDataSource
        self.productsCollectionView.dataSource = self.viewModel?.productDataSource
    }
    
    func getALLProducts(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getALLProducts(completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                self.viewModel?.getALLProducts(products: response)
                dispatch {
                    self.productsCollectionView.reloadData()
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
