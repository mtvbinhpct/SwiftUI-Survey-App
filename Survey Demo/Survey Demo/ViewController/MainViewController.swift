//
//  ViewController.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSurvey()
    }

    func showSurvey() {
        let surveyView = SurveyView()
        let surveyVC = SurveyViewController(rootView: surveyView)
        surveyVC.overrideUserInterfaceStyle = .light
        surveyVC.modalPresentationStyle = .fullScreen
        self.present(surveyVC, animated: false)
    }

}

