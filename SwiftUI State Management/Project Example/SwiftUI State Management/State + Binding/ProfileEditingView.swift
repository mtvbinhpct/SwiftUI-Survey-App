//
//  ProfileEditingView.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI

struct ProfileEditingView: View {
    @Binding var user: User

    var body: some View {
        VStack {
            TextField("Username", text: $user.username)
            TextField("Email", text: $user.email)
        }
        .padding()
    }
}

struct ProfileEditingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditingView(user: .constant(User(username: "aaa", email: "bbb")))
    }
}
