//
//  ContentView.swift
//  SwiftUI State Management
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 09/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 100) {
            //State + Binding
            ProfileView()
            //ObservedObject
           ProfileView2()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
