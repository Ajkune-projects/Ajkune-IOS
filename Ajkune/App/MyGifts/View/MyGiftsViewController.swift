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
    @IBOutlet weak var tableView: UITableView!
    //MARK: - IBOutlets

    
    //MARK: - Properties
    var viewModel: MyGiftsViewModelProtocol?
    var coordinator: MyGiftsCoordinator?
    override func viewDidLoad() {
        setupTableView()
        getMyGifts()
    }
    //MARK: - IBActions
    
    func getMyGifts(){
        self.viewModel?.getMyGifts(completion: { response in
            if response != nil {
                self.viewModel?.getGifts(gift: response ?? [Gift1]())
                self.tableView.reloadData()
            }
        })
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