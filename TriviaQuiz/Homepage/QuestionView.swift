//
//  QuestionView.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 07/05/2021.
//

import SwiftUI

struct QuestionView: View {
    var questionDefinition: QuestionDefinition
    var body: some View {
        VStack {
            HStack{
                Text(questionDefinition.category)
                Spacer()
                Text(questionDefinition.type)
            }.padding()

            HStack {
                VStack {
                    Text(questionDefinition.question)
                    
                }

            }
        }


    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let questionDefinition = QuestionDefinition(
            category: "Category", type: "Type", difficulty: "Difficulty", question: "Hows the SwiftUI going?", correct_answer: "Good", incorrect_answers: ["Not bad", "Alright", "Lets See"])
        QuestionView(questionDefinition: questionDefinition)
    }
}
