//
//  CommentDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import Foundation
import UIKit
final class CommentDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    //MARK: - Properties
    var comment: [Comment]?
    var commentOffer: [CommentsOffer]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if globalData.isOffer == true {
            return commentOffer?.count ?? 0
        }else{
        return comment?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CommentCell.self, for: indexPath)
        if globalData.isOffer == true {
            if let cm = commentOffer?[indexPath.row] {
                if let image = cm.user?.image_name{
                cell.userImage.setImage(with: image)
                }else{
                    cell.userImage.image = UIImage(named: "Avatar")
                }
                cell.userName.text = "\(cm.user?.name ?? "") \(cm.user?.last_name ?? "")"
                cell.commentTitle.text = cm.title
                cell.commentText.text = cm.comment
            }

        }else{
        if let cm = comment?[indexPath.row] {
            if let image = cm.user?.image_name{
            cell.userImage.setImage(with: image)
            }else{
                cell.userImage.image = UIImage(named: "Avatar")
            }
            cell.userName.text = "\(cm.user?.name ?? "") \(cm.user?.last_name ?? "")"
            cell.commentTitle.text = cm.title
            cell.commentText.text = cm.comment
        }
        return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    }
