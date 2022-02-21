//
//  MyGiftsViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import Foundation
import UIKit
import TextFieldEffects
class MyGiftsViewController: UIViewController , Storyboarded, UITextFieldDelegate{
    //MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    var viewModel: MyGiftsViewModelProtocol?
    var coordinator: MyGiftsCoordinator?
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        setupTableView()
        getMyGifts()
        refresh()
    }
    //MARK: - IBActions
    
    func getMyGifts(){
        self.viewModel?.getMyGifts(completion: { response in
            if response != nil {
                self.viewModel?.getGifts(gift: response ?? [Gift1]())
                self.tableView.reloadData()
            }
            if response?.count == 0{
                self.emptyView.isHidden = false
                self.emptyView.layer.zPosition = 999
            }else{
                self.emptyView.isHidden = true
            }
            self.refreshControl.endRefreshing()
        })
    }

    func refresh(){
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.scrollView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    @objc func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.getMyGifts()
        }
    }
    func setupTableView(){
        self.tableView.register(GiftCell.self)
        self.tableView.delegate = self.viewModel?.dataSource
        self.tableView.dataSource = self.viewModel?.dataSource
        
    }
    @IBAction func backPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
    
}
extension MyGiftsViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? MyGiftsCoordinator
    }
}
