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
    @IBOutlet weak var minValue: UIButton!
    @IBOutlet weak var maxValue: UIButton!
    
    //MARK: - Properties
    var viewModel: FilterProductsViewModelProtocol?
    var coordinator: FilterProductsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider.minimumValue = 5
        rangeSlider.lowerValue = 5
        rangeSlider.upperValue = 200
        rangeSlider.maximumValue = 200
        minValue.setTitle("CHF \(rangeSlider.lowerValue.roundToPlaces(places: 2))", for: .normal)
        maxValue.setTitle("CHF \(rangeSlider.upperValue.roundToPlaces(places: 2))", for: .normal)
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(_:)), for: .valueChanged)

    }
    @objc func rangeSliderValueChanged(_ rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
        minValue.setTitle("CHF \(rangeSlider.lowerValue.roundToPlaces(places: 2))", for: .normal)
        maxValue.setTitle("CHF \(rangeSlider.upperValue.roundToPlaces(places: 2))", for: .normal)
    }
    
    //IBActions
    @IBAction func productAction(_ sender: Any) {
        globalData.fromFilter = true
        let max = "\(rangeSlider.upperValue.roundToPlaces(places: 2))"
        let min = "\(rangeSlider.lowerValue.roundToPlaces(places: 2))"
        
        self.viewModel?.filterProducts(maxValue: max, minValue: min, type: "product", completion: { response in
            if response != nil {
                globalData.filteredProducts = response ?? [Products]()
                self.coordinator?.stop()
            }
        })
        
    }
    @IBAction func offerAction(_ sender: Any) {
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
