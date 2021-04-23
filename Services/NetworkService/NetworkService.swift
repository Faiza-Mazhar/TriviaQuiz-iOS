//
//  NetworkService.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 22/04/2021.
//

import Foundation

struct Welcome: Decodable {
    let responseCode: Int
    let results: [Question]
}

// MARK: - Result
struct Question: Decodable {
    let category, type, difficulty, question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}


class NetworkService {
    
    let domainUrlString = "https://opentdb.com/api.php?amount=1"

    func fetchQuestions(completionHandler: @escaping (Result<Any, Error>) -> Void) {
        let url = URL(string: domainUrlString)!

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
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

          do {
            let json  = try JSONSerialization.jsonObject(with: validData, options: [])
            completionHandler(.success(json))
          } catch let serializationError {
            completionHandler(.failure(serializationError))
          }
        }).resume()
    }
}

