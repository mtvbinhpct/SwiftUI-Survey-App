//
//  CustomButtonStyle.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let bgColor : Color
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(minWidth: 104, minHeight: 45)
            .background(bgColor)
            .foregroundColor(.white)
            .cornerRadius(20.0)
            .opacity(configuration.isPressed ? 0.1 : 1)
            .scaleEffect(configuration.isPressed ? 1.8 : 1)
            .animation(.easeInOut(duration: 0.2))
        
    }
}

struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Text("Sample Button")
                .bold()
        }
        .buttonStyle(CustomButtonStyle(bgColor: .blue))

    }
}
