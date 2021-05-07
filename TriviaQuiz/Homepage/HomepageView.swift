//
//  ContentView.swift
//  TriviaQuiz
//
//  Created by Faiza Mazhar on 22/04/2021.
//

import SwiftUI

struct HomepageView: View {

    @ObservedObject var viewModel = HomepageViewModel()


    var body: some View {

        if((viewModel.questions) == nil) {
            LoadingView()
        } else {
            Text("Lets show Question View")
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
