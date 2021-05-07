//
//  QuestionView.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 07/05/2021.
//

import SwiftUI

struct QuestionView: View {
    var questionMetadata: QuestionMetadata
    @State var selectedAnswer: String

    var body: some View {
        VStack {
            HStack{
                Text(questionMetadata.category)
                Spacer()
                Text(questionMetadata.type)
            }.padding()

            HStack {
                VStack {
                    Text(questionMetadata.question)

                    Picker("Please choose an answer", selection: $selectedAnswer) {
                        ForEach(questionMetadata.answers, id: \.self) {
                            Text($0)
                        }

                        Text("You selected: \(selectedAnswer)")
//                        Text("Right Answer: \(questionMetadata.correctAnswer)")
                    }
                }

            }
        }
        Spacer()

    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let questionMetadata = QuestionMetadata(
            category: "Category",
            type: "Type",
            difficulty: "Difficulty",
            question: "Hows the SwiftUI going?",
            correctAnswer: "Good",
            answers: ["Not bad", "Good", "Alright", "Lets See"])
        QuestionView(questionMetadata: questionMetadata,
                     selectedAnswer: questionMetadata.answers[0])
    }
}
