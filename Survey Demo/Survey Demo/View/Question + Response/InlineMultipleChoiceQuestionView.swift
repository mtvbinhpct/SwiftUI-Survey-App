//
//  InlineMultipleChoiceQuestionView.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import SwiftUI

struct InlineMultipleChoiceQuestionGroupView: View {
    @ObservedObject var group: InlineMultipleChoiceQuestionGroup
    @State var selectedIndices: Set<Int> = []
    @State var customText = ""
    
    var body: some View {
        VStack {
            Text(group.title).font(.title).fontWeight(.bold).padding(EdgeInsets(top: 12, leading: 12, bottom: 1, trailing: 12))
            
            ForEach(group.questions, id: \.uuid) { question in
                InlineMultipleChoiceQuestionView(question: question)
                    .padding(7)
                    .background(Color(.systemGray5).opacity(0.5))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(.systemGray5), lineWidth: 2))
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
                
        }.frame(maxWidth: .infinity)
    }
}

struct InlineMultipleChoiceQuestionGroupView_Previews: PreviewProvider {
    static var previews: some View {
        InlineMultipleChoiceQuestionGroupView(group: InlineMultipleChoiceQuestionGroup(title: "Title", questions: [MultipleChoiceQuestion(title: "a", items: ["a1", "a2", "a3"], tag: ""),MultipleChoiceQuestion(title: "b", items: ["b1", "b2", "b3"], tag: "")], tag: ""))
    }
}

struct InlineMultipleChoiceQuestionView: View {
    @ObservedObject var question: MultipleChoiceQuestion
    @State var selectedChoices: Set<UUID> = []
    let colors: [Color] = [.red, .green, .blue]
    
    private func getColor(_ choice: MultipleChoiceResponse) -> Color {
        return colors[question.choices.firstIndex(where: {$0.uuid == choice.uuid}) ?? 0]
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(question.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                    .opacity(0.8)
                    .padding(4)
//                Text("".appendingFormat("%i", selectedChoices.count))
//                    .opacity(0.5)
////                    .frame(width: 1, height: 1)
            }
            HStack {
                ForEach(question.choices, id: \.uuid) { choice in
                    Button(action: { selectChoice(choice) }, label: {
                        Spacer()
                        Text( choice.text )
                            .font(.system(size: 14, weight: choice.selected ? .bold : .semibold)).multilineTextAlignment(.center)
                            .foregroundColor( choice.selected ? Color(.label ) : Color(.label ).opacity(0.8) )
                            .padding(2)
                        Spacer()
                    })
                    .frame(width: 100, height: 40)
                    .background(getColor(choice).opacity( choice.selected ? 0.4 : 0.3 ))
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke( choice.selected ? getColor(choice) : getColor(choice).opacity(0.0), lineWidth: 2) )
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                    .padding(4)
                    .opacity( (selectedChoices.count > 0 && !selectedChoices.contains(choice.uuid)) ? 0.8 : 1.0 )

                }
            }
        }
    }
    
    func selectChoice(_ selectedChoice: MultipleChoiceResponse) {
        selectedChoices = []
        
        for choice in question.choices {
            if selectedChoice.uuid == choice.uuid {
                choice.selected = true;
                selectedChoices = [choice.uuid]
            } else {
                choice.selected = false;
            }

        }
    }
}

struct InlineMultipleChoiceQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        InlineMultipleChoiceQuestionView(question: MultipleChoiceQuestion(title: "title", items: ["a", "b", "c"], tag: ""))
    }
}
