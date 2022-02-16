//
//  MyGiftsDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import UIKit
final class MyGiftsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    //MARK: - Properties
    var myGifts: [Gift1]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGifts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(GiftCell.self, for: indexPath)
            if let gift = myGifts?[indexPath.row] {
                cell.giftImage.setImage(with: gift.imageURL ?? "")
                cell.giftDesc.text = gift.giftDescription ?? ""
            }
        return cell
        }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    }
