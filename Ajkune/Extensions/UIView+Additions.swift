//
//  UIView+Additions.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//
import Foundation
import UIKit

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }
    
}
extension UIImageView {
    override open func awakeFromNib() {
        super.awakeFromNib()
        tintColorDidChange()
    }
}
extension String {
    private static var digits = UnicodeScalar("0")..."9"
    var digits: String {
        return String(unicodeScalars.filter(String.digits.contains))
    }
}
extension Character {
    var isDecimalOrPeriod: Bool { "0"..."9" ~= self || self == "." }
}
extension RangeReplaceableCollection where Self: StringProtocol {
    var digitsAndPeriods: Self { filter(\.isDecimalOrPeriod) }
}
extension String {

    private func filterCharacters(unicodeScalarsFilter closure: (UnicodeScalar) -> Bool) -> String {
        return String(String.UnicodeScalarView(unicodeScalars.filter { closure($0) }))
    }

    private func filterCharacters(definedIn charSets: [CharacterSet], unicodeScalarsFilter: (CharacterSet, UnicodeScalar) -> Bool) -> String {
        if charSets.isEmpty { return self }
        let charSet = charSets.reduce(CharacterSet()) { return $0.union($1) }
        return filterCharacters { unicodeScalarsFilter(charSet, $0) }
    }

    func removeCharacters(charSets: [CharacterSet]) -> String { return filterCharacters(definedIn: charSets) { !$0.contains($1) } }
    func removeCharacters(charSet: CharacterSet) -> String { return removeCharacters(charSets: [charSet]) }

    func onlyCharacters(charSets: [CharacterSet]) -> String { return filterCharacters(definedIn: charSets) { $0.contains($1) } }
    func onlyCharacters(charSet: CharacterSet) -> String { return onlyCharacters(charSets: [charSet]) }

    var onlyDigits: String { return onlyCharacters(charSets: [.decimalDigits]) }
    var onlyLetters: String { return onlyCharacters(charSets: [.letters]) }
}

extension UIView {
    func shadowView(){
        layer.cornerRadius = 2
        layer.shadowRadius = 2
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0.6, height: 0.6)
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
    }
    
        func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
            let border = UIView()
            border.backgroundColor = color
            border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
            addSubview(border)
        }
}
