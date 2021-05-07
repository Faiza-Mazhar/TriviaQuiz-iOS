//
//  ContentView.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 22/04/2021.
//

import SwiftUI

struct HomepageView: View {

    @ObservedObject var viewModel = HomepageViewModel()
    @State private var currentIndex = 0
    @State private var score = 0

    @State private var isLastQuestion = false

    var body: some View {
        guard let question = viewModel.questions?[currentIndex] else { return AnyView(ProgressView())
        }

//        if(currentIndex < viewModel.questions!.count) {
//            return AnyView(
//            QuestionView(questionMetadata: question,
//                         selectedAnswer: question.answers[0],
//                         nextQuestionOnClickListerner: increamentIndex))
//        }

        if isLastQuestion {
            return AnyView(Text("Score: \(score) / \(currentIndex+1)"))
        } else {
            return AnyView(
            QuestionView(questionMetadata: question,
                         selectedAnswer: question.answers[0],
                         nextQuestionOnClickListerner: increamentIndexAndScore))
        }
            
    }

    func increamentIndexAndScore(score: Int) {
        if(currentIndex < viewModel.questions!.count - 1 ) {
            print("Question: \(currentIndex)")
            self.currentIndex = currentIndex + 1
        } else {
            self.isLastQuestion = true
        }
        self.score += score
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
