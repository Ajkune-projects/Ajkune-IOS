//
//  ViewController.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 21.10.21..
//

import UIKit
import Alamofire
import AlamofireImage

class HomeVC: UIViewController {
    
    @IBOutlet weak var productCollection: UICollectionView!
    @IBOutlet weak var CategoryCollection: UICollectionView!
    
    var products = [Products]()
    var categories = [Categories]()
    
    override func viewWillAppear(_ animated: Bool) {
        if KeychainManager.shared.isLoggedIn() == true {
            
            print("User  login ")
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController (vc, animated: true)
            print("User  login ")

        }
                navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCategories()
        getMyBookingsData()
        
        self.CategoryCollection.reloadData()

    }
    
    func getAllCategories() {
        GetCategory().perform { result in
            switch result {
                case .success(let categories):
                    self.categories = categories
                    self.CategoryCollection.reloadData()
                case .failure(let error):
                    print(error)
                    self.showErrorAlert(message: "\(error)")
            }
        }
    }
    
    func getMyBookingsData(){
        GetMyProducts().perform { result in
            switch result {
                case .success(let products):
                    self.products = products
                    self.productCollection.reloadData()
                case .failure(let error):
                    print(error)
                    self.showErrorAlert(message: "\(error)")
            }
        }
    }


}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if CategoryCollection == collectionView {
            return categories.count
        }
            return products.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if CategoryCollection == collectionView {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "Categorycell", for: indexPath) as! Categorycell
            let model =  categories[indexPath.row]
            cellB.NameCategry.text = model.name
            return cellB
        } else {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let model =  products[indexPath.row]
    //        cell.imageProduct
            let image_name = model.image
            let image_url = (image_name)!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            if let url = URL(string: image_url) {
                cellA.imageProduct.af_setImage(withURL: url)
            } else {
                print("error image")
            }
            cellA.decriptionProduct.text = model.name
            cellA.priceProduct.text = model.price! + "CHF"
            
            return cellA
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if CategoryCollection == collectionView {
            let idx = categories[indexPath.row]
            
            print(idx.id)
        } else {
            let idx = products[indexPath.row]
        }
    }
}

extension UIView {
    func shadowVeiw(){
        layer.cornerRadius = 5
        layer.shadowRadius = 5
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
    }
}
