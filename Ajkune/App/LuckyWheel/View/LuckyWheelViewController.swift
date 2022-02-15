//
//  LuckyWheelViewController.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//
import Foundation
import UIKit
import TextFieldEffects
import SwiftFortuneWheel

class LuckyWheelViewController: UIViewController , Storyboarded, UITextFieldDelegate{
    //MARK: - IBOutlets
    @IBOutlet weak var wheelControl: SwiftFortuneWheel! {
        didSet {
            wheelControl.configuration = .variousWheelPodiumConfiguration
        }
    }
    
    //MARK: - Properties
    var viewModel: LuckyWheelViewModelProtocol?
    var coordinator: LuckyWheelCoordinator?
    var gift:[GiftListElement] = []
    var slices: [Slice] = []
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfGifts()
        
        
    }
    func getListOfGifts(){
        self.viewModel?.luckyWheelGifts(completion: { response in
            if response != nil{
                self.gift = response ?? [GiftListElement]()
                self.fillData()
                self.wheelControl.slices = self.slices
            }
        })
    }
    
    func fillData(){
        for prize in gift {
            let url = URL(string:prize.imageURL ?? "")
            if let img = try? Data(contentsOf: url!)
            {
                self.image = UIImage(data: img) ?? UIImage()
            }
            let sliceContent = [Slice.ContentType.image(image: image ?? UIImage(), preferences: .variousWheelPodiumImage),
                                Slice.ContentType.text(text: prize.title ?? "", preferences: .variousWheelPodiumText(textColor: .white))]
            var slice = Slice(contents: sliceContent, backgroundColor: generateRandomColor())
            slices.append(slice)
        }
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    var finishIndex: Int {
        return Int.random(in: 0..<wheelControl.slices.count)
    }
    
    
    @IBAction func rotateTap(_ sender: Any) {
        wheelControl.startRotationAnimation(finishIndex: finishIndex, continuousRotationTime: 1) { (finished) in
            print(self.gift[self.finishIndex])
            self.viewModel?.addGift(id: self.gift[self.finishIndex].id ?? 0, completion: { response in
                if response?.success == true {
                self.viewModel?.showModal(gift: self.gift[self.finishIndex])
                self.coordinator?.stop()
                                }
            })
            //            self.coordinator?.stop()
        }
        
    }
    //MARK: - IBActions
    
    @IBAction func backButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
    
}
extension LuckyWheelViewController : TDCoordinated {
    
    func getCoordinator() -> TDCoordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: TDCoordinator) {
        self.coordinator = coordinator as? LuckyWheelCoordinator
    }
}

