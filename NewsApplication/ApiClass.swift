//
//  ApiClass.swift
//  NewsApplication
//
//  Created by Gourav Shukla on 16/08/17.
//  Copyright © 2017 Fishbowl. All rights reserved.
//

import Foundation


struct API {
    
    static let APIKey = ""
    static let BaseURL = URL(string:"https://newsapi.org/v1/articles?source=techcrunch&apiKey=ca1bcaa8272a4f81877d2239288fe865")!
    
    static var AuthenticatedBaseURL: URL {
        return BaseURL.appendingPathComponent(APIKey)
    }
    
}



enum DataManagerError: Error {
    
    case Unknown
    case FailedRequest
    case InvalidResponse
    
}

final class ApiClass {
    
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }

      typealias NewsCompletion = (AnyObject?, DataManagerError?) -> ()
    
    func NewsMethod(completion: @escaping NewsCompletion) {
        
        let URL = baseURL
        
      
        // Create Data Task
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
    // MARK: - Helper Methods
    
    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: NewsCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processWeatherData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }
            
        } else {
            completion(nil, .Unknown)
        }
    }
    
    private func processWeatherData(data: Data, completion: NewsCompletion) {
        if let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
            completion(JSON, nil)
        } else {
            completion(nil, .InvalidResponse)
        }
    }
    
    
    
    
    
}
