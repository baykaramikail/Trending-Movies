//
//  Networking.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 7.04.2023.
//

import Foundation
import Alamofire


enum NetworkError:Error{
    case urlError
    case canNotParseData
}

class NetworkManager{
    
    static let shared = NetworkManager()
    private init() { }
    
    func getMovies(comletionHandler: @escaping (_ result: Result<MovieModel,NetworkError>) -> Void) {
        
        let url: String = NetworkConstants.shared.baseUrl + NetworkConstants.shared.apiKey
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result{
            case .success(let data):
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(MovieModel.self, from: data!)
                    comletionHandler(.success(decodedData))
                    
                }catch{
                    print(error.localizedDescription)
                    comletionHandler(.failure(.canNotParseData))
                }
            case .failure(let error):
                print(error.localizedDescription)
                comletionHandler(.failure(.urlError))
            }
        }
    }
}


