//
//  BaseRequest.swift
//  PrishtinaJet
//
//  Created by Blerd Foniqi on 3/10/21.
//

import Foundation
import Alamofire

enum ApiError: Error {
    case noData
    case cannotDecode
}

class BaseRequest: URLRequestConvertible {
    private let baseUrlString = "http://45.77.54.158"
    
    var api: String {
        return "/api"
    }
    
//    var version: String {
//        return "/v1"
//    }
    
    var path: String {
        return "/"
    }
    
    var usesCleanBaseUrl = false
    
    var queryParams: String?
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var parameters: Encodable?
    
    var headers: HTTPHeaders? {
        return []
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = makeUrl() else {
            fatalError("Bad url")
        }
        var request = try URLRequest(url: url, method: method, headers: headers)
        if let parameters = parameters {
            let body = try? JSONSerialization.data(withJSONObject: parameters.dictionary, options: .prettyPrinted)
            request.httpBody = body
            print(request)
        }
        return request
    }
    
    private func makeUrl() -> URL? {
        var urlString = baseUrlString
        if usesCleanBaseUrl {
            urlString += path + (queryParams ?? "")
        }
        else {
            urlString += api + path + (queryParams ?? "")
        }
        return URL(string: urlString)
    }
}
extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
