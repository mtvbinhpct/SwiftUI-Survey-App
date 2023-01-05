//
//  Keyboard Helper.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 05/01/2023.
//

import Foundation
import SwiftUI

extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }

        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }

        return nil
    }
}

final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    
    @Published private(set) var currentHeight: CGFloat = 0
    @Published private(set) var isShowing: Bool = false

    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
        isShowing = true
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
        isShowing = false
    }
}
