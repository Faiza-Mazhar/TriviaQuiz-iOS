//
//  NetworkService.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 22/04/2021.
//

import Foundation

class NetworkService {
    
    func fetchData( url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        let baseUrl = URL(string: url)!

        URLSession.shared.dataTask(with: baseUrl, completionHandler: { (data, response, error) in
          if let error = error {
            completionHandler(.failure(error))
            return
          }

          if let httpResponse = response as? HTTPURLResponse {
            print("Status code \(httpResponse.statusCode)")
          }

          guard let validData = data, error == nil else {
            completionHandler(.failure(error!))
            return
          }

          completionHandler(.success(validData))

        }).resume()
    }
}

