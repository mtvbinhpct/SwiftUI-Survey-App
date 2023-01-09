//
//  ProfileView2.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI

struct ProfileView2: View {
    @ObservedObject var userController: UserModelController = UserModelController()
    @State private var isEditingViewShown = false

    var body: some View {
        VStack {
            Text("ObservedObject")
            VStack(alignment: .leading, spacing: 10) {
                Text("Username: ")
                    .foregroundColor(.secondary)
                    + Text(userController.user.username)
                Text("Email: ")
                    .foregroundColor(.secondary)
                    + Text(userController.user.email)
                Button(
                    action: { self.isEditingViewShown = true },
                    label: { Text("Edit") }
                )
            }
            .padding()
            .sheet(isPresented: $isEditingViewShown) {
                VStack {
                    ProfileEditingView2(userController: self.userController)
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

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView2(userController: UserModelController())
    }
}
