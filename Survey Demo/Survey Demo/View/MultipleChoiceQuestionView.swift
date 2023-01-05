//
//  MultipleChoiceQuestionView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI
import Combine

struct MultipleChoiceQuestionView: View {
    @ObservedObject var question: MultipleChoiceQuestion
    
    var scrollProxy: ScrollViewProxy?
    
    @State var selectedIndices: Set<Int> = []
    
    @State private var customTextEntry: String = ""
    
    var body: some View {
        VStack {
            Text(question.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 14, leading: 10, bottom: 8, trailing: 10))
            if question.allowsMultipleSelection {
                Text("Pick as many as you want")
                    .font(.title3)
                    .italic()
                    .foregroundColor(.gray)
            }
            
            ForEach (question.choices, id: \.uuid) { choice in
                MultipleChoiceResponseView(question: question, choice: choice, selectedIndices: $selectedIndices, scrollProxy: scrollProxy)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
    
    func selectChoice( _ selectedChoice : MultipleChoiceResponse ) {
        if question.allowsMultipleSelection {
            
            for (i,choice) in question.choices.enumerated() {
                if selectedChoice.uuid == choice.uuid {
                    if selectedIndices.contains(i) {
                        selectedIndices.remove(i)
                        question.choices[i].selected = false;
                        selectedChoice.selected = false;
                    } else {
                        selectedIndices.insert(i)
                        question.choices[i].selected = true;
                        selectedChoice.selected = true;
                    }
                    
                }
                
            }
            
        } else {
            
            selectedIndices = []
            for (i,choice) in question.choices.enumerated() {
                if selectedChoice.uuid == choice.uuid {
                    choice.selected = true;
                    selectedIndices = [i]
                } else {
                    choice.selected = false;
                }
                
            }
            
        }
        
    }
    
    func updateCustomText( _ selectedChoice : MultipleChoiceResponse, _ text : String ) {
        
        for (i,choice) in question.choices.enumerated() {
            if selectedChoice.uuid == choice.uuid {
                question.choices[i].customTextEntry = text
                selectedChoice.customTextEntry = text
            }
        }
        
    }
}

struct MultipleChoiceQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleChoiceQuestionView(question: MultipleChoiceQuestion(title: "What are you primarily using our app for?", answers: ["Work", "Fun","Other"], multiSelect: true, tag: ""))
    }
}

