//
//  Endpoint.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import Foundation

enum Endpoint{
    //https://api.yelp.com/v3/businesses/search?latitude=37.786882&longitude=-122.399972&categories=donuts, churros
    case getBusinessSearch
    
    var scheme: String{
        return "https"
    }
    
    var baseURL: String{
        return "api.yelp.com"
    }
    
    var path: String{
        switch self{
        case .getBusinessSearch:
            return "/v3/businesses/search"
        default:
            return "/v3/businesses/search"
        }
    }
    
    var method: String{
        return "GET"
    }
    
    var authorizationToken: String{
        switch self{
        case .getBusinessSearch:
            return "Bearer __AuZ4vuCk5WEurojw-QCogV2e9Zi8qNaVdOhm6o4v8DVfTFguSkBeN4Xfl7OmbXuBTuAamEgOq3LWKX9czUiCr0dV7PtE1hnlcWf09L8rp4YEofgSGow_GAQJxPYXYx"
        }
    }
    
    var query: [URLQueryItem]{
        switch self{
        case .getBusinessSearch:
          
        return [URLQueryItem(name: "categories", value: "Donuts, Churros"), URLQueryItem(name: "latitude", value: "37.786882"), URLQueryItem(name: "longitude", value: "122.399972")]
        }
    }
    
    var url: URL?{
        var components = URLComponents()
        print(scheme, baseURL, path)
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = query
        
        print(components.url)
        return components.url
    }
}
