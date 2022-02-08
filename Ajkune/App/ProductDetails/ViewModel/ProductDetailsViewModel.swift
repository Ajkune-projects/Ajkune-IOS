//
//  ProductDetailsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    weak var coordinatorDelegate: ProductDetailsViewModelCoordinatorDelegate?
    var commentDataSource: CommentDataSource?
    
    func showWebView(url: String) {
        self.coordinatorDelegate?.showWebView(url: url)
    }

    func getComments(comments: [Comment]) {
        commentDataSource?.comment = comments
    }
    
    public init(){
        self.commentDataSource = CommentDataSource()
        
    }
    //API
    func getProductDetails(id: Int, completion: @escaping (([ProductDetails]?) -> Void)) {
            let products = AuthenticationClient.getProductDetails(id: id)
            products.execute(onSuccess: { product in
                completion(product)
             }, onFailure: {error in
                completion(nil)
             })
    }
    func addComment(product_id:String,title:String, comment:String, completion: @escaping (([ProductDetails]?) -> Void)) {
        let comment = AuthenticationClient.addComment(product_id: product_id, title: title, comment: comment)
        comment.execute(onSuccess: { comment in
            completion(comment)
         }, onFailure: {error in
            completion(nil)
         })
        
    }
    
    
}
