//
//  UserModelController.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import Foundation

class UserModelController: ObservableObject {
    @Published var user: User = User()
}
