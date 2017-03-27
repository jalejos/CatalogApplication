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
    
    var url: URL {
        switch self {
        case .getMovies:
            return APIManager.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movies/v2/reviews/dvd-picks.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var params: Parameters {
        switch self {
        case let .getMovies(offset):
            let parameters: Parameters = ["api-key": APIManager.apiKey,
                                          "offset": offset]
            return parameters
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getMovies:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}
