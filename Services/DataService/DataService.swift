//
//  DataService.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

func tranformQuestionsDefinitionToQuestionMetadata(questionsDefinition: QuestionsDefinition) -> [QuestionMetadata] {
    var questionMetadata : [QuestionMetadata] = []

    for question in questionsDefinition.results {
        questionMetadata.append(
            QuestionMetadata(
                category: question.category,
                type: question.type,
                difficulty: question.difficulty,
                question: question.question,
                correctAnswer: question.correct_answer,
                incorrectAnswer: shuffleAnswers(correctAnswer: question.correct_answer, wrongAnswers: question.incorrect_answers))
        )
    }
    
    return questionMetadata
}

func shuffleAnswers(correctAnswer: String, wrongAnswers: [String]) -> [String] {
    var answers = wrongAnswers
    answers.append(correctAnswer)
    answers.shuffle()
    return answers
}
