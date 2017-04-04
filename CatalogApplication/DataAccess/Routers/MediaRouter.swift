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
    case getTop(category: Category)
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movies/v2/reviews/dvd-picks.json"
        case .getBooks:
            return "/books/v3/lists/best-sellers/history.json"
        case .getTop(let category):
            return "/mostpopular/v2/mostviewed/\(category.rawValue)/30.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: Parameters {
        let parameters: (_ offset: Int) -> (Parameters) = { (offset) in
            let params: Parameters = ["api-key": APIManager.apiKey,
                          "offset": offset]
            return params
        }
        switch self {
        case .getMovies(let offset), .getBooks(let offset):
            return parameters(offset)
        case .getTop:
            return parameters(0)
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = APIManager.baseURL
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        
        return urlRequest
    }
}
