//
//  DatabaseReferenceServiceMock.swift
//  Survey DemoTests
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 17/01/2023.
//

import Foundation
@testable import Survey_Demo

class DatabaseReferenceServiceMock : DatabaseReferenceProtocol {
    var isComplete: Bool = true
    
    func saveResponse(dictionary: [String : Any], completeHandler: ((Bool) -> Void)?) {
        completeHandler?(isComplete)
    }
}
