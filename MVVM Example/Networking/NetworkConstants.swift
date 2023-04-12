//
//  NetworkConstants.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 11.04.2023.
//

import Foundation

class NetworkConstants{
    
    static let shared = NetworkConstants()
    private init() { }
    
    public var baseUrl: String {
        get{
            return "https://api.themoviedb.org/3/trending/all/day?api_key="
        }
    }
    
    public var apiKey: String {
        get{
            return "bf94a88bec54bb970d0f8e344d0a9b26"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
