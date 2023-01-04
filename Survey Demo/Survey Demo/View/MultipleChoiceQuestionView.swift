//
//  MultipleChoiceQuestionView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI

struct MultipleChoiceQuestionView: View {
    @ObservedObject var question: MultipleChoiceQuestion
    
    var scrollProxy: ScrollViewProxy?
    
    @State var selectedIndices: Set<Int> = []
    
    @State private var customTextEntry: String = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MultipleChoiceQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleChoiceQuestionView(question: MultipleChoiceQuestion(title: "aaa", answers: [""], tag: ""))
    }
}
