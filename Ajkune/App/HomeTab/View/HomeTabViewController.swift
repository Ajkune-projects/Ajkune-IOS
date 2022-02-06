//
//  HomeTabViewController.swift
//
//  Created by Djellza Rrustemi
//

import UIKit
class HomeTabViewController: UIViewController, Storyboarded{
    
    //MARK: - Properties
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var bannerTitle: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    var viewModel: HomeTabViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupProductsCollectionView()
        setupCategoriesCollectionView()
        getALLCategories()
        getALLProducts()
        getBanner()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let ind =  IndexPath(item: 1, section: 0)
        self.categoryCollectionView.selectItem(at:ind, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
//        categoryCollectionView(self.categoryCollectionView, didSelectItemAt:ind)
//        categoryCollectionView(
    }
    
    func setupProductsCollectionView(){
        self.productsCollectionView.register(ProductCell.self)
        self.productsCollectionView.delegate = self.viewModel?.productDataSource
        self.productsCollectionView.dataSource = self.viewModel?.productDataSource
    }
    
    func setupCategoriesCollectionView(){
        self.categoryCollectionView.register(CategoriesCell.self)
        self.categoryCollectionView.delegate = self.viewModel?.categoryDataSource
        self.categoryCollectionView.dataSource = self.viewModel?.categoryDataSource
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

    func getALLCategories(){
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getCategories(completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                let newCategory = Categories(id: 0, name: "All products", position: 0, status: 1, created_at: "1", updated_at: "2")
                var category = response
                category?.insert(newCategory, at: 0)
                self.viewModel?.getCategorie(cat: category)
                dispatch {
                    self.categoryCollectionView.reloadData()
                    let indexPath:IndexPath = IndexPath(row: 0, section: 0)
                    self.categoryCollectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .top)
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
            }
        })
    }
}
extension HomeTabViewController: HomeTabViewModelViewDelegate{
    func productDetails(id: Int) {
        self.viewModel?.showProductDetails(id: id)
    }
    
    func selectedCategory(id: Int) {
        if id == 0 {
            getALLProducts()
        }else{
        SHOW_CUSTOM_LOADER()
        self.viewModel?.getProductsByID(id: id, completion: { response in
            HIDE_CUSTOM_LOADER()
            if response?.count != nil{
                self.viewModel?.getALLProducts(products: response)
                dispatch {
                    self.productsCollectionView.reloadData()
                }
            }
        })
        }
    }
    
}
