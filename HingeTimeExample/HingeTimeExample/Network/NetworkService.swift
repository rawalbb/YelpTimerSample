//
//  NetworkService.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import Foundation

private enum NetworkError: Error{
    case dataFailure
    case badResponse
    case badDecoding
}

class NetworkService{
    
    
    class func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void){
        guard let url = endpoint.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        urlRequest.addValue("Authorization", forHTTPHeaderField: endpoint.authorizationToken)
        print("YELLO")
        
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            print("HELLOOO")
            print(response, error)
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard response != nil else {
                completion(.failure(NetworkError.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.dataFailure))
                return
            }
            
            if let resultModel = try? JSONDecoder().decode(T.self, from: data){
                completion(.success(resultModel))
            }
            else{
                completion(.failure(NetworkError.badDecoding))
            }
            
        }.resume()
    }
}
