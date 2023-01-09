//
//  IntroView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI

struct IntroView: View {
    @Binding var surveyState: SurveyState
    @State private var animation = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.clear)
                .foregroundColor(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 1)
                )
            VStack {
                HStack {
                    Text("👋").font(.system(size: 80))
                }.padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
                Text("Raise your hand up!")
                    .font(.system(size: 45))
                    .multilineTextAlignment(.center)
                Text("We could use your feedback")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(20)
                Text("Plase take this short survey, it would mean a lot!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 10, trailing: 40))
                HStack {
                    Button {
                        takeSurveyTapped()
                    } label: {
                        Text("Take Survey")
                            .bold()
                            .padding(15)
                    }
                .buttonStyle(CustomButtonStyle(bgColor: .blue))
                }
                .padding(50)
            }
        }
        .padding(20)
        .opacity(animation ? 0 : 1.0)
        .animation(.easeOut(duration: 1.0))
    }
    
    func takeSurveyTapped() {
        animation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.surveyState = .taking
        })
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(surveyState: .constant(.showIntroScreen))
    }
}
