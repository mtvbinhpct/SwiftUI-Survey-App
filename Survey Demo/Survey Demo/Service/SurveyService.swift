//
//  SurveyService.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import Foundation
import Firebase

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
            //load from file
            if let fileUrl = Bundle.main.url(forResource: "sample_survey", withExtension: "json") {
                if let loadedSurvey = try? Survey.loadFromFile(url: fileUrl) {
                    completeHandler?(loadedSurvey)
                }
            }
           
        }
    }
    
    func saveResponseToServer(survey:Survey, completion: ((_ success: Bool)->())? ) {
        var ref: DatabaseReference!
        let url = "https://swiftui-demo-51ffc-default-rtdb.asia-southeast1.firebasedatabase.app"
        ref = Database.database(url: url).reference() //Database.database().reference()
        
        let UUID : UUID = UUID()
        let uuid_string = "\(UUID)"
        
        let dateFormatter = ISO8601DateFormatter()
        let timeStampString = dateFormatter.string(from: Date())

        let jsonData = Survey.getJsonDataForSurvey(survey: survey)
        
        do {
            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String: Any]
            else { completion?(false); return }
            ref.child("surveys").child(uuid_string).setValue([ "response": dictionary, "createdAt": timeStampString]) { error, db in
                if error != nil {
                    completion?(false)
                } else {
                    completion?(true)
                }
            }
            
        } catch {
            print(error.localizedDescription)
            completion?(false)
            
        }
    }
}
