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

struct SurveyView: View {
    @State var surveyState : SurveyState = .showIntroScreen
    @State var processing = false
    
    var body: some View {
        if surveyState == .showIntroScreen {
            IntroView().background(Color.green)
        }
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
