//
//  SurveyViewController.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import Foundation
import SwiftUI

class HostingViewController<ContentView> : UIHostingController<ContentView> where ContentView : View {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Portrait only for iPhone
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return [.portrait, .portraitUpsideDown]
        }
        return .all
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func dismiss(complete:@escaping ()->Void) {
        dismiss(animated: true) {
            complete()
        }
    }
}
