//
//  ChooseSourceView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 08/01/2023.
//

import SwiftUI

struct ChooseSourceView: View {
    var completHandler: (Survey?) -> Void
    var body: some View {
        VStack {
            Text("Where json file do you want to load from?")
                .font(.title)
                .padding()
            VStack(spacing: 10) {
                Button(action: { loadFromFile() }) {
                    Text("Local file")
                        .fontWeight(.semibold)
                }
                .buttonStyle(CustomButtonStyle(bgColor: .blue))
                
                Button(action: { loadFromRemote() }) {
                    Text("Remote config")
                        .fontWeight(.semibold)
                }
                .buttonStyle(CustomButtonStyle(bgColor: .blue))
            }
            .padding()
        }
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2).foregroundColor(.blue.opacity(0.5)))
    }
    
    func loadFromFile() {
        SurveyService().fetchSurvey(fetchType: .fromFile) { survey in
            self.completHandler(survey)
        }
    }
    
    func loadFromRemote() {
        SurveyService().fetchSurvey(fetchType: .fromRemoteConfig) { survey in
            self.completHandler(survey)
        }
    }
    
    init(completHandler: @escaping (Survey?) -> Void) {
        self.completHandler = completHandler
    }
}

struct ChooseSourceView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSourceView(completHandler: { survey in })
    }
}
