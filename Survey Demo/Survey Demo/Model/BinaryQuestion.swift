//
//  BinaryQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

class BinaryQuestion: ObservableObject, SurveyQuestion {
    var title: String
    
    var uuid: UUID = UUID()
    
    var tag: String
    
    var required: Bool = false
    
    var visibilityLogic: VisibilityLogic?
    
    var autoAdvanceOnChoice: Bool
    
    var choices: [MultipleChoiceResponse]
    
    init(title: String, answers: [String], autoAdvanceOnChoice: Bool = true, tag: String) {
        self.title = title
        self.tag = tag
        self.autoAdvanceOnChoice = autoAdvanceOnChoice
        self.choices = answers.map({MultipleChoiceResponse($0)})
        assert(self.choices.count == 2)
    }
    
}
