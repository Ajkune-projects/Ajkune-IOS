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
    var categoryID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupProductsCollectionView()
        setupCategoriesCollectionView()
        filterData()
        getALLProducts()
        getBanner()
    }
    override func viewWillAppear(_ animated: Bool) {
        filterData()
    }
    func filterData(){
        if globalData.fromAllCategories == true {
            if globalData.categorySelected == 0 {
                getALLProducts()
                globalData.categoryIndexPath = IndexPath(row: 0, section: 0)
                self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
            }else{
                getCategoryByID(id: globalData.categorySelected)
            }
        }else if globalData.fromFilter == true{
            self.viewModel?.getALLProducts(products: globalData.filteredProducts)
            globalData.categoryIndexPath = IndexPath(row: 0, section: 0)
            self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
            self.categoryCollectionView.scrollToItem(at: globalData.categoryIndexPath, at: .centeredHorizontally, animated: true)
            dispatch {
                self.productsCollectionView.reloadData()
            }
        }else{
            getALLCategories()
        }
        globalData.fromFilter = false
        globalData.fromAllCategories = false
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
                let newCategory = Categories(id: 0, name: "ALL PRODUCTS", position: 0, status: 1, created_at: "1", updated_at: "2")
                var category = response
                category?.insert(newCategory, at: 0)
                self.viewModel?.getCategorie(cat: category)
                dispatch {
                    self.categoryCollectionView.reloadData()
                    //                    let index:IndexPath = IndexPath(row: 2, section: 0)
                    self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
                    
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
                    self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
                    self.categoryCollectionView.scrollToItem(at: globalData.categoryIndexPath, at: .centeredHorizontally, animated: true)
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
    @IBAction func seeAllCategoriesPressed(_ sender: Any) {
        self.viewModel?.seeAllCategories()
    }
    
    @IBAction func filterProducts(_ sender: Any) {
        self.viewModel?.filterProducts()
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
