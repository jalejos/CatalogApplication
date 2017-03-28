//
//  MediaRouter.swift
//  CatalogApplication
//
//  Created by Alejos on 3/27/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Alamofire

enum MediaRouter: URLRequestConvertible {
    case getMovies(offset: Int)
    case getBooks(offset: Int)
    
    var url: URL {
        switch self {
        case .getMovies, .getBooks:
            return APIManager.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movies/v2/reviews/dvd-picks.json"
        case .getBooks:
            return "/books/v3/lists/best-sellers/history.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies, .getBooks:
            return .get
        }
    }
    
    var params: Parameters {
        switch self {
        case let .getMovies(offset), let .getBooks(offset):
            let parameters: Parameters = ["api-key": APIManager.apiKey,
                                          "offset": offset]
            return parameters
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getMovies, .getBooks:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}
