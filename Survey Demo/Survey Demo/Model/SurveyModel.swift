//
//  SurveyModel.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

enum SurveyItemType : Int, Codable {
    case multipleChoiceQuestion
    case binaryChoice
    case contactForm
    case inlineQuestionGroup
    case commentsForm
}

final class Survey : ObservableObject, Codable {
    @Published var questions : [SurveyQuestion]
    
    let version : String
    
    var metadata : [String : String]?
    
    enum CodingKeys : CodingKey {
        case questions
        case version
        case metadata
    }
    
    init(_ questions: [SurveyQuestion], version: String) {
        self.version = version
        self.questions = questions
        var tags: Set<String> = []
        for question in questions {
            assert(!tags.contains(question.tag), "Duplicate Tag!")
            tags.insert(question.tag)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.questions = try container.decode([SurveyItem].self, forKey: .questions).map({ $0.question})
        self.version = try container.decode(String.self, forKey: .version)
    }
    
    func encode(to encoder: Encoder) throws {
        var container  = encoder.container(keyedBy: CodingKeys.self)
        let wrapped = self.questions.map({ SurveyItem(question: $0) })
        try container.encode(wrapped, forKey: .questions)
        try container.encode(version, forKey: .version)
        if let meta = self.metadata {
            try container.encode(meta, forKey: .metadata)
        }
    }
    
    func choiceWithId(_ id: UUID) -> MultipleChoiceResponse? {
        for question in questions {
            if let question = question as? MultipleChoiceQuestion {
                for c in question.choices {
                    if c.uuid == id {
                        return c
                    }
                }
            } else if let question = question as? BinaryQuestion {
                for c in question.choices {
                    if c.uuid == id {
                        return c
                    }
                }
            }
        }
        return nil
    }
}
