//
//  Signup.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI

struct SignupView: View {
    var handler: (User) -> Void

    @State private var username = ""
    @State private var email = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
            TextField("Email", text: $email)
            Button(
                action: {
                    self.handler(User(
                        username: self.username,
                        email: self.email
                    ))
                },
                label: { Text("Sign up") }
            )
        }
        .padding()
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(handler: {_ in })
    }
}
