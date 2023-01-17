//
//  RemoteConfigServiceMock.swift
//  Survey DemoTests
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 17/01/2023.
//

import Foundation
@testable import Survey_Demo

class RemoteConfigServiceMock : RemoteConfigServiceProtocol {
    var handler : FetchCompleteHandler?
    var survey : Survey?
    
    func loadSurvey(handler: FetchCompleteHandler?) {
        self.handler = handler
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        self.handler?(survey)
    }
}
