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

    var body: some View {
        guard let question = viewModel.questions?[currentIndex] else { return AnyView(LoadingView())
        }

        return AnyView(
        QuestionView(questionMetadata: question, selectedAnswer: "String"))
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
