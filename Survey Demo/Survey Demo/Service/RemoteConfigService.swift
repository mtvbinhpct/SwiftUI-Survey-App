//
//  RemoteConfigService.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation
import Firebase

typealias FetchCompleteHandler = (Survey?) -> Void

class RemoteConfigService {
    var remoteConfig: RemoteConfig!
    var handler : FetchCompleteHandler?
    
    func loadSurvey(handler: FetchCompleteHandler?) -> Void {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        self.handler = handler
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        remoteConfig.fetch { status, error in
            if status == .success {
                self.remoteConfig.activate() { changed, error in
                    //get survey
                    let surveyRemoteJsonKey = "SURVEY_DATA"
                    if let remoteSurveyJsonString = self.remoteConfig[surveyRemoteJsonKey].stringValue {
                        if let surveyFromRemote : Survey = Survey.getSurveyFromString(jsonString: remoteSurveyJsonString) {
                            self.handler?(surveyFromRemote)
                        }
                    }
                }
            }
        }
    }
}
