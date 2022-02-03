//
//  UnderlineItemView.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
import UIKit
import PinCodeInputView

final class UnderlineItemView: UIView, ItemType {
    
    var text: Character? = nil {
        didSet {
            guard let text = text else {
                label.text = nil
                return
            }
            label.text = String(text)
        }
    }
    
    var isHiddenCursor: Bool = false
    
    private let label: UILabel = .init()
    private let underLineView: UIView = .init()
    
    init() {
        
        super.init(frame: .zero)
        
        addSubview(label)
        addSubview(underLineView)
        
        clipsToBounds = true
        
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        
        underLineView.backgroundColor = Colors.overcastBlueColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
        
        let width: CGFloat = bounds.width
        let height: CGFloat = 2
        
        underLineView.frame = CGRect(
            x: (bounds.width - width) / 2,
            y: (bounds.height - height),
            width: width,
            height: height
        )
    }
    
    func set(appearance: ItemAppearance) {
        
        label.font = appearance.font
        label.textColor = appearance.textColor
        layoutIfNeeded()
    }
    
}

