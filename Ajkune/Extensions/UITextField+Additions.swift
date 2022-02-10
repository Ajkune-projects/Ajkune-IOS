//
//  UITextField+Additions.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

import UIKit
extension UITextField{
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
    
    //MARK:- Set Image on left of text fields
    
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 15, height: 15))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension UITextView {

    private class PlaceholderLabel: UILabel { }

    private var placeholderLabel: PlaceholderLabel {
        if let label = subviews.compactMap( { $0 as? PlaceholderLabel }).first {
            return label
        } else {
            let label = PlaceholderLabel(frame: .zero)
//            label.font = Fonts.robotoRegular(size: 14)
            label.textColor = UIColor(hexString: "#918fb7")
            addSubview(label)
            return label
        }
    }

    @IBInspectable
    var placeholder: String {
        get {
            return subviews.compactMap( { $0 as? PlaceholderLabel }).first?.text ?? ""
        }
        set {
            let placeholderLabel = self.placeholderLabel
            placeholderLabel.text = newValue
            placeholderLabel.numberOfLines = 0
            let width = frame.width - textContainer.lineFragmentPadding * 2
            let size = placeholderLabel.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
            placeholderLabel.frame.size.height = size.height
            placeholderLabel.frame.size.width = width
            placeholderLabel.frame.origin = CGPoint(x: textContainer.lineFragmentPadding, y: textContainerInset.top+5)

            textStorage.delegate = self
        }
    }

}

extension UITextView: NSTextStorageDelegate {

    public func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorage.EditActions, range editedRange: NSRange, changeInLength delta: Int) {
        if editedMask.contains(.editedCharacters) {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }

}
extension UITextField{

 func addDoneButtonToKeyboard(myAction:Selector?){
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    doneToolbar.barStyle = UIBarStyle.default

     let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: myAction)

    var items = [UIBarButtonItem]()
    items.append(flexSpace)
    items.append(done)

    doneToolbar.items = items
    doneToolbar.sizeToFit()

    self.inputAccessoryView = doneToolbar
 }
}
