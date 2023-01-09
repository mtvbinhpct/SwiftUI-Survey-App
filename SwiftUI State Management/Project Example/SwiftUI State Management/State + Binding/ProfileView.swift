//
//  ProfileView.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var user = User()
    @State private var isEditingViewShown = false

    var body: some View {
        
        VStack() {
            Text("State + Binding")
            VStack(alignment: .leading, spacing: 10) {
                Text("Username: ")
                    .foregroundColor(.secondary)
                    + Text(user.username)
                Text("Email: ")
                    .foregroundColor(.secondary)
                    + Text(user.email)
                Button(
                    action: { self.isEditingViewShown = true },
                    label: { Text("Edit") }
                )
            }
            .padding()
            .sheet(isPresented: $isEditingViewShown) {
                VStack {
                    ProfileEditingView(user: self.$user)
                    Button(
                        action: { self.isEditingViewShown = false },
                        label: { Text("Done") }
                    )
                }
        }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2))
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
