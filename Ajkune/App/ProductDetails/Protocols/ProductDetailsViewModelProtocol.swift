//
//  ProductDetailsViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
protocol ProductDetailsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ProductDetailsViewModelCoordinatorDelegate? {get set}
    var commentDataSource : CommentDataSource? {get}
    func getComments(comments: [Comment])
    func showWebView(url:String)
    
    //API
    func getProductDetails(id:Int, completion: @escaping (([Products]?) -> Void))
    func addComment(product_id:String,title:String, comment:String, completion: @escaping (([Products]?) -> Void)) 
}
