//
//  UITableView+UICollectionView.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self),
                                           for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
}

extension UITableView {
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) -> T {
        guard
            let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T
            
            else { fatalError("Could not deque cell with type \(T.self)") }
        
        return view
    }
}

extension UIScrollView {
    func scrollToBottom(_ animated:Bool = true){
        DispatchQueue.main.async {
            let h = self.contentSize.height - self.frame.size.height
            if h < 0 {return}
            let scrollPoint = CGPoint(x: 0, y: h)
            self.setContentOffset(scrollPoint, animated: animated)
        }
    }
    
    func scrollToTop(_ animated:Bool = true){
        DispatchQueue.main.async {
            let scrollPoint = CGPoint(x: 0, y: -20)
            self.setContentOffset(scrollPoint, animated: animated)
        }
    }
}


extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeue<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self),
                                           for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
}
extension UICollectionView {
    func registerFooter<T: UICollectionReusableView>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        
        self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueFooter<T: UICollectionReusableView>(_: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
            
            else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
    
    func registerHeader<T: UICollectionReusableView>(_: T.Type, reuseIdentifier: String? = nil) {
        let nib = UINib(nibName: reuseIdentifier ?? String(describing: T.self), bundle: nil)
        
        self.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueHeader<T: UICollectionReusableView>(_: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
            
            else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
}
