//
//  ProfileEditingView2.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI


struct ProfileEditingView2: View {
    @ObservedObject var userController: UserModelController

    var body: some View {
        VStack {
            TextField("Username", text: $userController.user.username)
            TextField("Email", text: $userController.user.email)
        }
        .padding()
    }
}

struct ProfileEditingView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingView2(userController: UserModelController())
    }
}
