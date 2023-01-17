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
    var remoteConfig : RemoteConfigServiceProtocol
    var databaseService : DatabaseReferenceProtocol
    
    init(fetchCompleteHandler: FetchCompleteHandler? = nil, remoteConfig: RemoteConfigServiceProtocol = RemoteConfigService(), databaseService: DatabaseReferenceProtocol = DatabaseReferenceService() ) {
        self.fetchCompleteHandler = fetchCompleteHandler
        self.remoteConfig = remoteConfig
        self.databaseService = databaseService
    }
    
    func fetchSurvey(fetchType: FetchType = .fromFile, completeHandler: FetchCompleteHandler?) {
        if fetchType == .fromRemoteConfig {
            remoteConfig.loadSurvey(handler: completeHandler)
        } else {
            //load from file
            if let fileUrl = Bundle.main.url(forResource: "sample_survey", withExtension: "json") {
                if let loadedSurvey = try? Survey.loadFromFile(url: fileUrl) {
                    completeHandler?(loadedSurvey)
                }
            }
        }
    }
    
    func saveResponseToServer(survey:Survey, completion: ((_ success: Bool)->())? ) {
        let jsonData = Survey.getJsonDataForSurvey(survey: survey)
        do {
            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String: Any]
            else { completion?(false); return }
            databaseService.saveResponse(dictionary: dictionary) { success in
                completion?(success)
            }
            
        } catch {
            print(error.localizedDescription)
            completion?(false)
        }
    }
}
