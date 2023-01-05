//
//  SurveyHelper+Filrebase.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation


extension Survey {
    static func getSurveyFromString(jsonString: String) -> Survey? {
        do {
            let jsonData = jsonString.data(using: .utf8)!
            let survey = try JSONDecoder().decode(Survey.self, from: jsonData)
            return survey
        } catch {
            print(error)
        }
        return nil
    }
}

func TitleToTag( _ tag : String ) -> String {
    
    let invalidCharacters = CharacterSet(charactersIn: "\\/:*?\"<>|")
        .union(.newlines)
        .union(.illegalCharacters)
        .union(.controlCharacters)
    
    return tag
        .components(separatedBy: invalidCharacters)
        .joined(separator: "")
    
    .components(separatedBy: .whitespacesAndNewlines)
        .filter { !$0.isEmpty }
        .joined(separator: "-")
    
}

extension Bundle {
    var releaseVersionNumber: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    var buildVersionNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
}
