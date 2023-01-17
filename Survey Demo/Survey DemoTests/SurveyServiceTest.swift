//
//  SurveyServiceTest.swift
//  Survey DemoTests
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 17/01/2023.
//

import Foundation
import XCTest
@testable import Survey_Demo



class SurveyServiceTests: XCTestCase {
    func testFetchSurvey_FromFile() {
        let service = SurveyService()
        let expectation = self.expectation(description: "Fetch survey from file")
        
        service.fetchSurvey { survey in
            XCTAssertNotNil(survey)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testFetchSurvey_FromRemoteConfig() {
        let mockRemoteConfig = RemoteConfigServiceMock()
        mockRemoteConfig.survey = Survey([], version: "")
        let service = SurveyService(remoteConfig: mockRemoteConfig)
        let expectation = self.expectation(description: "Fetch survey from remote config")
        
        service.fetchSurvey(fetchType: .fromRemoteConfig) { survey in
            XCTAssertNotNil(survey)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
    }
    
    func testSaveResponseToServer_Success() {
        let databaseService = DatabaseReferenceServiceMock()
        let service = SurveyService(databaseService: databaseService)
        let exp = self.expectation(description: "wait fetch survey")
        let survey = Survey([], version: "1")
        service.saveResponseToServer(survey: survey) { success in
            XCTAssertTrue(success)
            exp.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
}
