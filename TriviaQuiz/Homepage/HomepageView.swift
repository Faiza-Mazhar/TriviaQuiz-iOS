//
//  ContentView.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 22/04/2021.
//

import SwiftUI

struct HomepageView: View {

    @StateObject var viewModel = HomepageViewModel()

    var body: some View {

        Text("Hello, world!")
            .padding()
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
