//
//  MultipleChoiceQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

class MultipleChoiceQuestion : ObservableObject, SurveyQuestion {
    let title: String
    let uuid: UUID
    var visibilityLogic: VisibilityLogic?
    var required: Bool = false
    var allowMultipleSelection = false
    var tag: String
    var choices : [MultipleChoiceResponse]
    
    init(title: String, answers:[String], multiSelect: Bool = false, tag: String) {
        self.title = title
        self.uuid = UUID()
        self.tag = tag
        self.allowMultipleSelection = multiSelect
        self.choices = answers.map({ MultipleChoiceResponse($0) })
        
    }
    
    init(title: String, items: [Any], multiSelect: Bool = false, tag: String) {
        self.title = title
        self.uuid = UUID()
        self.tag = tag
        self.allowMultipleSelection = multiSelect

        self.choices = []
        for item in items {
            if let item2 = item as? String {
                self.choices.append( MultipleChoiceResponse(item2) )
            } else if let item2 = item as? MultipleChoiceResponse {
                self.choices.append( item2 )
            }
        }
    }
}

class MultipleChoiceResponse: ObservableObject, Codable {
    let text: String
    let uuid: UUID
    var selected = false
    let allowCustomTextEntry: Bool
    init(_ text: String, allowCustomTextEntry: Bool = false) {
        self.text = text
        self.uuid = UUID()
        self.allowCustomTextEntry = allowCustomTextEntry
    }
    
}
