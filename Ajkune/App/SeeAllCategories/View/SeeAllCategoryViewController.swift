//
//  SeeAllCategoryViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import Foundation
import UIKit
class SeeAllCategoriesViewController: UIViewController, Storyboarded{
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var viewModel: SeeAllCategoriesViewModelProtocol?
    var coordinator: SeeAllCategoriesCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
        setupCategoriesTableView()
        getALLCategories()
        self.tableView.rowHeight = 40
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView?.selectRow(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
    }
    func setupCategoriesTableView(){
        self.tableView.register(CategoryCell.self)
        self.tableView.delegate = self.viewModel?.dataSource
        self.tableView.dataSource = self.viewModel?.dataSource
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
                    self.tableView.reloadData()
                    self.tableView?.selectRow(at: globalData.categoryIndexPath, animated: false, scrollPosition: .top)
                }
            }
        })
    }
    
    //IBActions
    @IBAction func closeButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
    

}

extension SeeAllCategoriesViewController: SeeAllCategoriesViewModelViewDelegate{

    func selectedCategory(id: Int) {
        coordinator?.stop()
    }
    
}
extension SeeAllCategoriesViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? SeeAllCategoriesCoordinator
    }
}
