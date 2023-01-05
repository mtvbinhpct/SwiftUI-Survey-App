//
//  ViewController.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SurveyService().fetchSurvey(fetchType: .fromFile) { survey in
            if let survey = survey {
                DispatchQueue.main.async {
                    self.showSurvey(survey)
                }
            }
        }
    }

    func showSurvey(_ survey: Survey) {
        let surveyView = SurveyView(survey: survey)
        let surveyVC = SurveyViewController(rootView: surveyView)
        surveyVC.overrideUserInterfaceStyle = .light
        surveyVC.modalPresentationStyle = .fullScreen
        self.present(surveyVC, animated: false)
    }

}

