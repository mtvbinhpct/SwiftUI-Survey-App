//
//  SurveyService.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import Foundation

enum FetchType {
    case fromRemoteConfig
    case fromFile
}


class SurveyService {
    var fetchCompleteHandler: FetchCompleteHandler?
    
    func fetchSurvey(fetchType: FetchType = .fromFile, completeHandler: FetchCompleteHandler?) {
        if fetchType == .fromRemoteConfig {
            RemoteConfigService().loadSurvey(handler: completeHandler)
        } else {
//            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            let documentsDirectory = paths[0]
//            let jsonUrl = documentsDirectory.appendingPathComponent("sample_survey.json")
            if let fileUrl = Bundle.main.url(forResource: "sample_survey", withExtension: "json") {
                if let loadedSurvey = try? Survey.loadFromFile(url: fileUrl) {
                    completeHandler?(loadedSurvey)
                }
            }
           
        }
    }
}
