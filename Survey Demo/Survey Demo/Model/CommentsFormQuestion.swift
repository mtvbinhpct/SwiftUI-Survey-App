//
//  CommentsFormQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

class CommentsFormQuestion : ObservableObject, SurveyQuestion {
    
    let title: String
    let subtitle: String
    let uuid: UUID
    
    var required: Bool = false
    
    var visibilityLogic : VisibilityLogic?
    var tag: String
    
    // Info
    var emailAddress : String = ""
    var feedback : String = ""
    
    init(title:String, subtitle : String, tag: String) {
        self.title = title
        self.uuid = UUID()
        self.subtitle = subtitle
        self.tag = tag
    }
    
}
