//
//  SeeAllCategoriesViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//
import Foundation
protocol SeeAllCategoriesViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : SeeAllCategoriesViewModelCoordinatorDelegate? {get set}
    var viewDelegate: SeeAllCategoriesViewModelViewDelegate? {get set}
    var dataSource : SeeAllCategoriesDataSource? {get}
    func getCategorie(cat: [Categories]?)
    
    //API
    func getCategories(completion: @escaping (([Categories]?) -> Void))
}
