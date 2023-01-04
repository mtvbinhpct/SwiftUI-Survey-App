//
//  SurveyView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI

enum SurveyState {
    case showIntroScreen
    case taking
    case complete
}

protocol SurveyViewDelegate: AnyObject {
    func surveyCompleted(with survey: Survey)
}

struct SurveyView: View {
    @State var surveyState : SurveyState = .showIntroScreen
    
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
                
            }
        }
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
