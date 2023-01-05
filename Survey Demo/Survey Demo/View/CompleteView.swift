//
//  CompleteView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import SwiftUI

struct CompleteView: View {
    @Binding var state: SurveyState
    var submitSurveyTap : (() -> Void)?
    var restartSurveyTap : (() -> Void)?
    
    var body: some View {
        VStack {
            
            Text("👍").font(.system(size: 120)).padding(EdgeInsets(top: 60, leading: 0, bottom: 20, trailing: 0))
            
            Text("Thanks!").font(.system(size: 45)).multilineTextAlignment(.center)
          
            Text("We really appreciate your feedback!").font(.title).padding(30).multilineTextAlignment(.center)
            if state == .complete {
                Button(action: { submitSurveyTap?() }, label: {
                    Text("Submit Survey").bold()
                }).buttonStyle(CustomButtonStyle(bgColor: Color.blue)).padding()
            } else {
                Text("You're all done!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .animation(.easeInOut(duration: 1))
            }

            Button(action: { restartSurveyTap?() }, label: {
                Text("Retake Survey")
            }).padding()
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView(state: .constant(.submitComplete))
    }
}
