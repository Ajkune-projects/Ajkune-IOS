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
            wheelControl.slices = slices
        }
    }

    //MARK: - Properties
    var viewModel: LuckyWheelViewModelProtocol?
    var coordinator: LuckyWheelCoordinator?
//    var gift:[GiftListElement] = []
//    var slices:[Slice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let list = GiftListElement(id: 1, title: "Test", giftListDescription: "hello", imageURL: "", status: 1)
//        gift.append(list)
//        sl()
    }
    

    func generateRandomColor() -> UIColor {
      let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
      let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
      let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black

      return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
    var prizes = [(name: "MONEY",imageName: "Avatar", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "GRAPHIC", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "HOME",imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "33", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "44", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "555", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "666", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "111", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                  (name: "2222", imageName: "smileIcon", textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    
    lazy var slices: [Slice] = {
        var slices: [Slice] = []
        for prize in prizes {
            let sliceContent = [Slice.ContentType.assetImage(name: prize.imageName, preferences: .variousWheelPodiumImage),
                                Slice.ContentType.text(text: prize.name, preferences: .variousWheelPodiumText(textColor: prize.textColor))]
            var slice = Slice(contents: sliceContent, backgroundColor: generateRandomColor())
            slices.append(slice)
        }
        return slices
    }()

    var finishIndex: Int {
        return Int.random(in: 0..<wheelControl.slices.count)
    }

    
    @IBAction func rotateTap(_ sender: Any) {
        wheelControl.startRotationAnimation(finishIndex: finishIndex, continuousRotationTime: 1) { (finished) in
            print(self.prizes[self.finishIndex])
            self.coordinator?.stop()
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

