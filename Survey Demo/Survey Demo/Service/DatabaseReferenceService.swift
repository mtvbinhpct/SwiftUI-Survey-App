//
//  DatabaseReferenceService.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 17/01/2023.
//

import Foundation
import Firebase

protocol DatabaseReferenceProtocol {
    func saveResponse(dictionary: [String: Any], completeHandler:((Bool)->Void)?)
}

class DatabaseReferenceService : DatabaseReferenceProtocol {
    var refDatabase : DatabaseReference
    var completeHandler: ((Bool)->Void)? = nil
    
    init() {
        let url = "https://swiftui-demo-51ffc-default-rtdb.asia-southeast1.firebasedatabase.app"
        self.refDatabase = Database.database(url: url).reference()
    }
    
    func saveResponse(dictionary: [String: Any], completeHandler:((Bool)->Void)?) {
        self.completeHandler = completeHandler
        let UUID : UUID = UUID()
        let uuid_string = "\(UUID)"
        let dateFormatter = ISO8601DateFormatter()
        let timeStampString = dateFormatter.string(from: Date())
        self.refDatabase.child("surveys").child(uuid_string).setValue([ "response": dictionary, "createdAt": timeStampString]) { error, db in
            if error != nil {
                self.completeHandler?(false)
            } else {
                self.completeHandler?(true)
            }
        }
    }
}
