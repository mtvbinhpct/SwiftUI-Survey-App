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
}

class VisibilityLogic : Codable {
    enum LogicType : Int, Codable {
        case choiceMustBeSelected
        case choiceMustNotBeSelected
    }
    
    let type: LogicType
    
    let choiceID : UUID
    
    init(type: LogicType, choiceID: UUID) {
        self.type = type
        self.choiceID = choiceID
    }
}

