//
//  HomepageViewModel.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

import Foundation

class HomepageViewModel: Identifiable, ObservableObject {

    let id = UUID()

    @Published var questions: [QuestionMetadata]?


    init() {
        loadData()
    }

    func loadData() {

            NetworkService().fetchData(url: "https://opentdb.com/api.php?amount=10&type=multiple") { result in
                switch result {
                case .success(let data):
                    UI {
                        let questionsDefinition =  JSONService().getJson(data: data, of: QuestionsDefinition.self)
                        self.questions = tranformQuestionsDefinitionToQuestionMetadata(questionsDefinition: questionsDefinition!)
                    }
                case .failure(let error):
                    print(error)
                }
            }

    }

}

func BG(_ block: @escaping ()->Void) {
    DispatchQueue.global(qos: .default).async(execute: block)
}

func UI(_ block: @escaping ()->Void) {
    DispatchQueue.main.async(execute: block)
}


