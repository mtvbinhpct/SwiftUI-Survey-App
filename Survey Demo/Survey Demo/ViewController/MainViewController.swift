//
//  ViewController.swift
//  Survey Demo
//
//  Created by Pham Chi Thai Binh(BinhPCT) on 04/01/2023.
//

import UIKit

class MainViewController: UIViewController {
    var chooseVC: HostingViewController<ChooseSourceView>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if chooseVC == nil {
            let chooseView = ChooseSourceView(completHandler: { survey in
                if let survey = survey {
                    DispatchQueue.main.async {
                        self.showSurvey(survey)
                    }
                }
            })
            chooseVC = HostingViewController(rootView:chooseView)
            chooseVC!.overrideUserInterfaceStyle = .light
            chooseVC!.modalPresentationStyle = .fullScreen
            self.present(chooseVC!, animated: false)
        }
        
    }

    func showSurvey(_ survey: Survey) {
        chooseVC?.dismiss {
            let surveyView = SurveyView(survey: survey)
            let surveyVC = HostingViewController(rootView: surveyView)
            surveyVC.overrideUserInterfaceStyle = .light
            surveyVC.modalPresentationStyle = .fullScreen
            self.present(surveyVC, animated: true)
        }
        
    }

}

