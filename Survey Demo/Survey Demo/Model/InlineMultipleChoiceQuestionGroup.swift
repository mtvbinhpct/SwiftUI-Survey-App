//
//  InlineMultipleChoiceQuestionGroup.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

class InlineMultipleChoiceQuestionGroup : ObservableObject, SurveyQuestion {
    
    let title : String
    let uuid: UUID
    var questions : [MultipleChoiceQuestion]
    
    var visibilityLogic : VisibilityLogic?
    var required: Bool = false
    let tag: String
    
    init(title:String, questions:[MultipleChoiceQuestion], tag: String ) {
        self.title = title
        self.uuid = UUID()
        self.questions = questions
        self.tag = tag
    }
}
