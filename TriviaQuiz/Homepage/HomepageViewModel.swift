//
//  HomepageViewModel.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

import Foundation

class HomepageViewModel: Identifiable, ObservableObject {

    let id = UUID()

    @Published private (set) var questions: [QuestionDefinition] = []

    init() {
        NetworkService().fetchData(url: "https://opentdb.com/api_category.php") { result in
            switch result {
            case .success(let data):
                JSONService().getJson(data: data, of: Categories.self)
            case .failure(let error):
                print(error)
            }
        }
    }
}


