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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CommentCell.self, for: indexPath)
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

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    }
