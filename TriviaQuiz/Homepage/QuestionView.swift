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
    @State private var submit = false
    @State private var score = 0

    var nextQuestionOnClickListerner: ((Int) -> Void)

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
                    }

                    if submit {
                        Text("You choose: \(selectedAnswer)").padding()
                        Text("Right answer is: \(questionMetadata.correctAnswer)").padding()
                        Text("Score is: \(score)").padding()
                    }
                }
            }.padding()

            Button("Submit") {
                submit.toggle()
                if(selectedAnswer == questionMetadata.correctAnswer) {
                    score = 1
                } else {
                    score = 0
                }


            }.contentShape(Rectangle()).padding()

            Button("Next") {

                self.selectedAnswer = ""
                submit.toggle()

                nextQuestionOnClickListerner(self.score)
                
            }.contentShape(Rectangle()).padding()

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
                     selectedAnswer: questionMetadata.answers[0]){ _ in

        }
    }
}
