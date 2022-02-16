//
//  FilterProductsViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/8/22.
//

import UIKit
import WARangeSlider

class FilterProductsViewController: UIViewController , Storyboarded{
    @IBOutlet weak var rangeSlider: RangeSlider!
    @IBOutlet weak var productBtn: UIButton!
    @IBOutlet weak var minValue: UIButton!
    @IBOutlet weak var maxValue: UIButton!
    @IBOutlet weak var offerBtn: UIButton!
    
    //MARK: - Properties
    var viewModel: FilterProductsViewModelProtocol?
    var coordinator: FilterProductsCoordinator?
    var type:String?
    var filterInOffer:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider.minimumValue = 5
        rangeSlider.lowerValue = 5
        rangeSlider.upperValue = 200
        rangeSlider.maximumValue = 200
        minValue.setTitle("CHF \(rangeSlider.lowerValue.roundToPlaces(places: 2))", for: .normal)
        maxValue.setTitle("CHF \(rangeSlider.upperValue.roundToPlaces(places: 2))", for: .normal)
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)), for: .valueChanged)
     setupUI()

    }
    @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
        minValue.setTitle("CHF \(rangeSlider.lowerValue.roundToPlaces(places: 2))", for: .normal)
        maxValue.setTitle("CHF \(rangeSlider.upperValue.roundToPlaces(places: 2))", for: .normal)
    }
    func setupUI(){
        if  globalData.filterFromOffer ?? false == true{
            setupActiveButton(button: offerBtn)
            setupInActiveButton(button: productBtn)
            type = "offer"
        }else{
            setupActiveButton(button: productBtn)
            setupInActiveButton(button: offerBtn)
            type = "product"
        }
    }
    
    func setupActiveButton(button:UIButton){
        button.backgroundColor = Colors.overcastBlueColor
        button.setTitleColor(.white, for: .normal)
        button.borderColor = .white
        
    }
    func setupInActiveButton(button:UIButton){
        button.backgroundColor = .white
        button.borderColor = Colors.lightGray
        button.setTitleColor(Colors.lightGray, for: .normal)
        
    }
    
    //IBActions
    @IBAction func productAction(_ sender: Any) {
        setupActiveButton(button: productBtn)
        setupInActiveButton(button: offerBtn)
        type = "product"
    }
    @IBAction func offerAction(_ sender: Any) {
        setupActiveButton(button: offerBtn)
        setupInActiveButton(button: productBtn)
        type = "offer"
        
    }
    @IBAction func filterProducts(_ sender: Any) {
        filterData(type:type ?? "")
    }
    
    func filterData(type:String){
        globalData.fromFilter = true

        let max = "\(rangeSlider.upperValue.roundToPlaces(places: 2))"
        let min = "\(rangeSlider.lowerValue.roundToPlaces(places: 2))"
        
        self.viewModel?.filterProducts(maxValue: max, minValue: min, type: type, completion: { response in
            if response != nil {
                globalData.filteredProducts = response ?? [Products]()
                if globalData.filterFromOffer == false && type == "offer"{
                    if let tabBarController = self.tabBarController{
                        tabBarController.selectedIndex = 3
                    }
                }else if globalData.filterFromOffer == true && type == "product" {
                    if let tabBarController = self.tabBarController{
                        tabBarController.selectedIndex = 0
                    }
                }
                self.coordinator?.stop()
                
            }
            
        })
                
    }
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
}

extension FilterProductsViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? FilterProductsCoordinator
    }
}
extension Double {
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
