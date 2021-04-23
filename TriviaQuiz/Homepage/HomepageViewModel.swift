//
//  HomepageViewModel.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

import Foundation

class HomepageViewModel: Identifiable, ObservableObject {

    let id = UUID()

    @Published private (set) var questions: [Question] = []

    init() {
        NetworkService().fetchQuestions { result in
            switch result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}


