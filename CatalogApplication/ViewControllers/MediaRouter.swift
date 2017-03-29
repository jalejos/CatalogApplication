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
    case getTop(category: Categories)
    
    var url: URL {
        switch self {
        case .getMovies, .getBooks, .getTop:
            return APIManager.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movies/v2/reviews/dvd-picks.json"
        case .getBooks:
            return "/books/v3/lists/best-sellers/history.json"
        case let .getTop(category):
            return "/mostpopular/v2/mostviewed/\(category.rawValue)/30.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies, .getBooks, .getTop:
            return .get
        }
    }
    
    var params: Parameters {
        let parameters: (_ offset: Int) -> (Parameters) = { (offset) in
            let params = ["appid": APIManager.apiKey,
                          "offset": offset] as [String : Any]
            return params
        }
        switch self {
        case let .getMovies(offset), let .getBooks(offset):
            return parameters(offset)
        case .getTop:
            return parameters(0)
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getMovies, .getBooks, .getTop:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}
