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
    @IBOutlet weak var tableViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var categoriesLabel: UILabel!
    var viewModel: HomeTabViewModelProtocol?
    var categoryID:Int?
    @IBOutlet weak var initialPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupProductsCollectionView()
        setupCategoriesCollectionView()
        productsCollectionView.isScrollEnabled = false
        filterData()
        getALLProducts()
        getBanner()
        filterData()
        globalData.filterFromOffer = false
        categoryCollectionView.collectionViewLayout = layoutConfig()
        addObservers()
        localized()
    }
    
    func localized(){
        categoriesLabel.text = "Categories"
    }
    
    func layoutConfig() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
    func addObservers(){
        registerNotification(notification: Notification.Name.changeLang, selector: #selector(self.updateLang(notification:)))
    }
    @objc func updateLang(notification: Notification) {
        localized()
        productsCollectionView.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        filterData()
        globalData.filterFromOffer = false
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
                if globalData.filteredProducts.count == 0 {
                        self.tableViewHeightConst.constant = 300
                }else{
                    self.view.layoutIfNeeded()
                   self.tableViewHeightConst.constant = self.productsCollectionView.contentSize.height
                            self.view.layoutIfNeeded()
                }
            }
           
        }else{
            getALLCategories()
        }
        globalData.fromFilter = false
        globalData.fromAllCategories = false
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
                    self.view.layoutIfNeeded()
                   self.tableViewHeightConst.constant = self.productsCollectionView.contentSize.height
                            self.view.layoutIfNeeded()
                }
            } })
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
//
                    self.categoryCollectionView?.selectItem(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
                    self.categoryCollectionView.scrollToItem(at: globalData.categoryIndexPath, at: .centeredHorizontally, animated: true)
                }
            }
            if response?.count == 0{
                self.tableViewHeightConst.constant = 300
            }else{
                self.productsCollectionView.reloadData()
                self.tableViewHeightConst.constant = self.productsCollectionView.contentSize.height
                         self.view.layoutIfNeeded()
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
                self.priceLabel.text = "\(response?.first?.price ?? "0.0")CHF"
                self.initialPrice.text = "\(response?.first?.initial_price ?? "0.0")CHF"
            }
        })
    }
    @IBAction func seeAllCategoriesPressed(_ sender: Any) {
        self.viewModel?.seeAllCategories()
    }
    
    @IBAction func filterProducts(_ sender: Any) {
        globalData.fromAllCategoriesOffer = true
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
                if response?.count == 0{
                    self.tableViewHeightConst.constant = 300
                }

            })
        }
    }
    
}
