//
//  SurveyItem.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

final class SurveyItem : Codable {
    let type : SurveyItemType
    let question : SurveyQuestion
    
    enum CodingKeys : CodingKey {
        case type, question
    }
    
    init(question: SurveyQuestion) {
        self.question = question
        self.type = question.type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(SurveyItemType.self, forKey: .type)
        
        switch self.type {
        case .multipleChoiceQuestion:
            self.question = try container.decode(MultipleChoiceQuestion.self, forKey: .question)
        case .binaryChoice:
            self.question = try container.decode(BinaryQuestion.self, forKey: .question)
        case .contactForm:
            self.question = try container.decode(ContactFormQuestion.self, forKey: .question)
        case .inlineQuestionGroup:
            self.question = try container.decode(InlineMultipleChoiceQuestionGroup.self, forKey: .question)
        case .commentsForm:
            self.question = try container.decode(CommentsFormQuestion.self, forKey: .question)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)
        switch self.type {
        case .multipleChoiceQuestion:
            try container.encode(self.question as! MultipleChoiceQuestion, forKey: .question)
        case .binaryChoice:
            try container.encode(self.question as! BinaryQuestion, forKey: .question)
        case .contactForm:
            try container.encode(self.question as! ContactFormQuestion, forKey: .question)
        case .inlineQuestionGroup:
            try container.encode(self.question as! InlineMultipleChoiceQuestionGroup, forKey: .question)
        case .commentsForm:
            try container.encode(self.question as! CommentsFormQuestion, forKey: .question)
        }
    }
}
