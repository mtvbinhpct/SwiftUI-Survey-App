//
//  ContactFormQuestion.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import SwiftUI

struct ContactFormQuestionView: View {
    @ObservedObject var question: ContactFormQuestion
    
    var body: some View {
        VStack {
            Text(question.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(16)
            VStack(alignment: .leading) {
                Text("Name (optional):")
                    .font(.callout)
                    .bold()
                TextField("Name", text: $question.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
            }.padding()
            
            VStack(alignment: .leading) {
                Text("Email:")
                    .font(.callout)
                    .bold()
                TextField("Email", text: $question.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
            }.padding()
            
            VStack(alignment: .leading) {
                Text("Company (optinal):")
                    .font(.callout)
                    .bold()
                TextField("Company", text: $question.company)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
            }.padding()
            
            VStack(alignment: .leading) {
                Text("Feedback (optional):")
                    .font(.callout)
                    .bold()
                TextField("Feedback", text: $question.feedback)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
            }.padding()
        }
    }
}

struct ContactFormQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormQuestionView(question:ContactFormQuestion(title: "Contact", tag: ""))
    }
}
