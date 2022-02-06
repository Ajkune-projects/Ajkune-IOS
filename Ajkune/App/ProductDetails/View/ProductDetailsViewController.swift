//
//  ProductDetailsViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit
import Cosmos
class ProductDetailsViewController: UIViewController, Storyboarded {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productRaiting: CosmosView!
    @IBOutlet weak var productDetails: UILabel!
    
    //MARK:Properties
    var coordinator: ProductDetailsCoordinator?
    var viewModel: ProductDetailsViewModelProtocol?
    var product = [Products]()
    var id:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getProduct()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getProduct()
    }
    //MARK: - Functions
    func fillData(){
        let prod = product.first
        if let img = prod?.image{
        self.productImage.setImage(with: img)
        }
        self.productName.text = prod?.name ?? ""
        self.productRaiting.rating = Double(prod?.rating ?? 0 )
        self.productDetails.text = prod?.desc_en
        
    }
    
    //API
    func getProduct(){
//        SHOW_CUSTOM_LOADER()
        self.viewModel?.getProductDetails(id:self.id ?? 0, completion: { response in
//            HIDE_CUSTOM_LOADER()
            print("prod:\(response?.first)")
//            if response?.count ?? 0 > 0{
//                self.product = response ?? [Products]()
//                self.fillData()
//            }
        })
    }

   


    
    //MARK: - IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
    @IBAction func buyProductAction(_ sender: Any) {
        
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

