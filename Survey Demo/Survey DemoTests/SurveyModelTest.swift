//
//  SurveyTest.swift
//  Survey DemoTests
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 17/01/2023.
//

import Foundation
import XCTest
@testable import Survey_Demo

class SurveyTests: XCTestCase {
    func testLoadFromFile() throws {
        guard let url = Bundle.main.url(forResource: "sample_survey", withExtension: "json") else {
            XCTFail("sample_survey.json not found")
            return
        }
        let survey = try Survey.loadFromFile(url: url)
        XCTAssertEqual(survey.version, "001")
        XCTAssertEqual(survey.questions.count, 7)
    }
    
    func testGetJsonDataForSurvey() {
        let questions = MultipleChoiceQuestion(title: "What is your favorite color?", items: [
            MultipleChoiceResponse("Red", allowsCustomTextEntry: false, selected: false),
            MultipleChoiceResponse("Green", allowsCustomTextEntry: false, selected: false),
            MultipleChoiceResponse("Blue", allowsCustomTextEntry: false, selected: false),
        ], tag: "tag1")
        let survey = Survey([questions], version: "1")
        let jsonData = Survey.getJsonDataForSurvey(survey: survey)
        XCTAssertNotNil(jsonData)
    }
    
    func testChoiceWithId() {
        let choices = [MultipleChoiceResponse("Red", allowsCustomTextEntry: false, selected: false),
                       MultipleChoiceResponse("Green", allowsCustomTextEntry: false, selected: false),
                       MultipleChoiceResponse("Blue", allowsCustomTextEntry: false, selected: false)]
        let question = MultipleChoiceQuestion(title: "What is your favorite color?", items: choices, tag: "tag1")
        let survey = Survey([question], version: "1.0")
        let choice = survey.choiceWithId(choices[1].uuid)
        XCTAssertEqual(choice?.text, "Green")
    }
}
