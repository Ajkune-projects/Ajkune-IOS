//
//  TDAPIConstants.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 02.02.22.
//

struct TDAPIConstants {
    struct DevelopmentServer {
        static let baseURL = "http://45.77.54.158/api"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

