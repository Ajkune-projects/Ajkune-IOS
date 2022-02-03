//
//  TDAPIConfiguration.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22
//

import Alamofire

protocol TDAPIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
