//
//  SurveyQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation


protocol SurveyQuestion : Codable {
    var title : String { get }
    
    var uuid : UUID { get }
    
    var tag : String { get }
    
    var type : SurveyItemType { get }
    
    var required : Bool { get set }
    
    var visibilityLogic : VisibilityLogic? { get set }
}

extension SurveyQuestion {
    var type : SurveyItemType {
        if self is MultipleChoiceQuestion {
            return .multipleChoiceQuestion
        } else if self is BinaryQuestion {
            return .binaryChoice
        } else if self is ContactFormQuestion {
            return .contactForm
        } else if self is InlineMultipleChoiceQuestionGroup {
            return .inlineQuestionGroup
        } 
        return .commentsForm
    }
    
    func isVisible(for survey: Survey) -> Bool {
        if let logic = self.visibilityLogic {
            if logic.type == .choiceMustBeSelected {
                
            }
        }
        return true
    }
    
    func setVisibleWhenSelected( _ response : MultipleChoiceResponse ) -> Self {
        var new = self
        new.visibilityLogic = VisibilityLogic(type: .choiceMustBeSelected, choiceId: response.uuid)
        return new
    }
}

class VisibilityLogic : Codable {
    enum LogicType : Int, Codable {
        case choiceMustBeSelected
        case choiceMustNotBeSelected
    }
    
    let type: LogicType
    
    let choiceId : UUID
    
    init(type: LogicType, choiceId: UUID) {
        self.type = type
        self.choiceId = choiceId
    }
}

