//
//  SurveyView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI
import Combine

enum SurveyState {
    case showIntroScreen
    case taking
    case complete
}

protocol SurveyViewDelegate: AnyObject {
    func surveyCompleted(with survey: Survey)
}

struct SurveyView: View {
    @State var surveyState : SurveyState = .taking
    
    @State var processing = false
    
    @ObservedObject var survey : Survey
    
    @State var currentQuestion: Int = 0
    
    var delegate: SurveyViewDelegate?
    
    var body: some View {
        if surveyState == .showIntroScreen {
            IntroView(surveyState: $surveyState)
        }
        else if surveyState == .taking {
            VStack(spacing:0) {
                Text("Question ".appendingFormat("%i / %i", currentQuestion+1, self.survey.questions.count))
                    .bold().padding(EdgeInsets(top: 5, leading: 0, bottom: 2, trailing: 0))
                    .frame(maxWidth: .infinity)
                
                ForEach(survey.questions.indices, id: \.self) { i in
                    if i == currentQuestion {
                        ScrollViewReader { proxy in
                            ScrollView {
                                if let question = survey.questions[currentQuestion] as? MultipleChoiceQuestion {
                                    MultipleChoiceQuestionView(question: question, scrollProxy: proxy)
                                }
                            }
                            .background(Color.white)
                            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color(.systemGray4)), alignment: .top)
                        }
                    }
                }
                
                HStack {
                    Button(action: { previousTapped() }, label: {
                        Text("Previous")
                            .foregroundColor(Color(.secondaryLabel))
                            .bold()
                    })
                    Spacer()
                    Button(action: { nextTapped() }) {
                        Text("Next").bold()
                    }
                    .buttonStyle(CustomButtonStyle(bgColor: .blue))
                }
                .padding(EdgeInsets(top: 12, leading: 22, bottom: 18, trailing: 22))
                .background(Color(.systemGray6))
                .edgesIgnoringSafeArea([.leading, .trailing])
            }.background(Color.white)
            
        }
    }
    
//    private func closeKeyboard() {
//        UIApplication.shared.endEditing()
//    }
    
    func previousTapped() {
        var i = currentQuestion
        while i > 0 {
            i = i - 1
            let question = survey.questions[i]
            if question.isVisible(for: survey) {
                currentQuestion = i
                break
            }
        }
    }
    
    func nextTapped() {
        if currentQuestion == survey.questions.count - 1 {
            //done
            setSurveyComplete()
        } else {
            for i in (self.currentQuestion+1) ..< survey.questions.count {
                let question = survey.questions[i]
                if question.isVisible(for: survey) {
                    currentQuestion = i
                    break
                }
                if i == self.survey.questions.count - 1 {
                    setSurveyComplete()
                }
            }
        }
    }
    
    func setSurveyComplete() {
        surveyState = .complete
    }
    
    func restartSurvey() {
        currentQuestion = 0
        surveyState = .taking
    }
    
    init(survey: Survey, delegate: SurveyViewDelegate? = nil) {
        self.survey = survey
        self.delegate = delegate
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(survey: SampleSurvey).preferredColorScheme(.light)
    }
}