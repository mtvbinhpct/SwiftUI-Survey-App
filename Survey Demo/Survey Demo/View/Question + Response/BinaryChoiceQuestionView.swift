//
//  BinaryChoiceQuestionView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import SwiftUI

struct BinaryChoiceQuestionView: View {
    
    @State var selectedIndices: Set<Int> = []
    @ObservedObject var question: BinaryQuestion
    
    let onChoiceMade: (() -> Void)?
    
    @State private var autoAdvanceProgress: CGFloat = 0.0
    @State private var goingToNext: Bool = true
    
    var body: some View {
        VStack {
            Text(question.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(16)
            HStack {
                Button(action: { selectChoice(0)}) {
                    Text(question.choices[0].text)
                        .font(.title2).bold()
                }
                .buttonStyle(YesNoButtonStyle(bgColor: selectedIndices.contains(0) ? Color.green : Color.gray))
                .padding(6)
                
                Button(action: { selectChoice(1)}) {
                    Text(question.choices[1].text)
                        .font(.title2).bold()
                }
                .buttonStyle(YesNoButtonStyle(bgColor: selectedIndices.contains(1) ? Color.green : Color.gray))
                .padding(6)
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 20, trailing: 20))
        }
        .onAppear {
            autoAdvanceProgress = 0
            updateChoice()
        }
        .frame(maxWidth: .infinity)
        .overlay(Rectangle().frame(width: autoAdvanceProgress, height: 3, alignment: .top).foregroundColor(Color(.systemBlue)), alignment: .top)
        .animation(.easeInOut(duration: 0.5))
    }
    
    func updateChoice() {
        selectedIndices = []
        for (i, choice) in question.choices.enumerated() {
            if choice.selected {
                selectedIndices.insert(i)
            }
        }
    }
    
    func selectChoice(_ choiceIndex: Int) {
        selectedIndices = []
        selectedIndices.insert(choiceIndex)
        for (i, choice) in question.choices.enumerated() {
            choice.selected = i == choiceIndex
            question.choices[i].selected = choice.selected
        }
        goingToNext = true
    }
}

struct BinaryChoiceQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        BinaryChoiceQuestionView(question: BinaryQuestion(title: "Binary question", answers: ["Yes", "No"], tag: "tag"), onChoiceMade: nil)
    }
}
