//
//  TDAPIClient.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//
import Alamofire
import PromisedFuture
import UIKit
import SwiftyJSON

class TDAPIClient {
    @discardableResult
    static func performRequest<T:Decodable>(route:TDAPIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> Future<T, Error> {
        return Future(operation: { completion in
            AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let value):
                    print("Status code == \(response.response?.statusCode)")
                    completion(.success(value))
                case .failure(let error):
                    print("Status error: \(error), statuTDode: \(response.response?.statusCode)")
                    completion(.failure(error))
                }
            })
        })
    }
}
