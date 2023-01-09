//
//  CommentFormQuestionView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import SwiftUI

struct CommentsFormQuestionView : View {
    
    @ObservedObject var question : CommentsFormQuestion
    
    var body : some View {
        VStack {
            Text(question.title).font(.title).fontWeight(.bold).padding(EdgeInsets(top: 12, leading: 28, bottom: 2, trailing: 28))
            //Text(question.subtitle).font(.title3).background(Color.red).padding(16)
            Text(question.subtitle).font(.title3).italic().foregroundColor(Color(.secondaryLabel))
                .padding(EdgeInsets(top: 0, leading: 28, bottom: 1, trailing: 28))
            
            VStack(alignment: .leading) {
                Text("Email Address")
                    .font(.callout)
                    .bold()
                
//                TextFieldWithDone(placeHolder:"Email Address", text: $question.emailAddress, keyType: .emailAddress)
                
                // OR
                TextField("Email Address", text: $question.emailAddress )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    
            }.padding()
            VStack(alignment: .leading) {
                Text("Comments")
                    .font(.callout)
                    .bold()
                TextEditorWithDone(text: $question.feedback )
                    .disableAutocorrection(true)
                    .frame(height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke( Color(.systemGray5), lineWidth: 1) )
                    .background(RoundedRectangle(cornerRadius: 28).fill(Color.white))

            }.padding()
        }
    }

    func isValidEmailAddress(emailAddressString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: emailAddressString)
    }

    
}


struct CommentFormQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsFormQuestionView(question: CommentsFormQuestion(title: "Comment question", subtitle: "subtitle", tag: "tag"))
    }
}
