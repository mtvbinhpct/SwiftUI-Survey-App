//
//  ContactFormQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation

class ContactFormQuestion: ObservableObject, SurveyQuestion {
    var title: String
    
    var uuid: UUID
    
    var tag: String
    
    var required: Bool = false
    
    var visibilityLogic: VisibilityLogic?
    
    //Info
    var emailAddress : String = ""
    var name : String = ""
    var company : String = ""
    var phoneNumber : String = ""
    var feedback : String = ""
    
    init(title:String, tag : String ) {
        self.title = title
        self.uuid = UUID()
        self.tag = tag
    }
}
