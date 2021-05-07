//
//  JSONService.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

import Foundation

class JSONService {

    func getJson<T: Codable >(data: Data, of type: T.Type ) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
