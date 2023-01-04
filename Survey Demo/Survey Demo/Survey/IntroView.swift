//
//  IntroView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI

struct IntroView: View {
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
                    Text("😀").font(.system(size: 100))
                }.padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
                Text("Help Us Out?")
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
            
                
        }.padding(20)
    }
    
    func takeSurveyTapped() {
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
