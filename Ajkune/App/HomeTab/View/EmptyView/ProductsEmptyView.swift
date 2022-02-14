//
//  ProductsEmptyView.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
import UIKit

class ProductsEmptyView: UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var descLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        self.view.frame = bounds
        self.addSubview(self.view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        self.view.frame = bounds
            self.addSubview(self.view)
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ProductsEmptyView", owner: self, options: nil)
//        view.fixInView(self)
    }

}
