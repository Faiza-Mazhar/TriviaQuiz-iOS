//
//  DataModels.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 23/04/2021.
//

import Foundation

//MARK: - QuestionsDefinition
struct QuestionsDefinition: Codable {
    let response_code: Int
    let results: [QuestionDefinition]
}

// MARK: - QuestionDefinition
struct QuestionDefinition: Codable {
    let category, type, difficulty, question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

// MARK: - CategoriesDefinition
struct CategoryDefinition: Codable {
    let id: Int
    let name: String
}

// MARK: - CategoriesDefinition
struct Categories: Codable {
    let trivia_categories: [CategoryDefinition]
}

// MARK: QuestionMetadata
struct QuestionMetadata {
    let category, type, difficulty, question: String
    let correctAnswer: String
    let incorrectAnswer: [String]
}

// MARK: CategoriesMetadata
struct CategoryMetadata: Codable {
    let id: Int
    let categoryName: String
}
