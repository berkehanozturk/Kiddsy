//
//  LanguageSelectionViewController.swift
//  FairyTales
//
//  Created by Berkehan on 21.02.2022.
//

import UIKit
import UIComponents

protocol LanguageSelectionRouter: AnyObject {
    func goToHomeScreen()
}

protocol LanguageSelectionView: AnyObject {
    func updateFlagForward(with: UIImage)
    func updateFlagBackward(with: UIImage)

}

class LanguageSelectionViewController: BaseViewController {
    
    var presenter = LanguageSelectionPresenter()
    

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var rightButton: UIButton! {
        didSet {
            rightButton.setTitle("", for: .normal)
        }
    }
    
    @IBOutlet weak var leftButton: UIButton! {
        didSet {
            leftButton.setTitle("", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)

    }
    
    func setup() {
        self.view.backgroundColor = UIColor.veryLightBlue
        backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func rightButtonClicked(_ sender: Any) {
        presenter.forwardButtonClicked()

    }

    @IBAction func leftButtonClicked(_ sender: Any) {
        presenter.backwardButtonClicked()
    }
    
    @IBAction func buttonCliked(_ sender: Any) {
        presenter.continueButtonClicked()
    }
}

extension LanguageSelectionViewController: LanguageSelectionView {
    func updateFlagBackward(with: UIImage) {
        UIView.transition(with: flagImageView,
                          duration: 0.45,
                          options: .transitionCurlDown,
                          animations: { self.flagImageView.image = with
        }, completion: nil)
        
        self.updateContinueButtonText()

    }
    
    func updateFlagForward(with: UIImage) {
        UIView.transition(with: flagImageView,
                          duration: 0.45,
                          options: .transitionCurlUp,
                          animations: { self.flagImageView.image = with
        }, completion: nil)
        
        self.updateContinueButtonText()
    }
    
    func updateContinueButtonText() {
        continueButton.setTitle(Localizables.Language.continueText, for: .normal)
    }

}

extension LanguageSelectionViewController: LanguageSelectionRouter {
    func goToHomeScreen() {
        let homeVc = HomeModule.initModule()
        navigationController?.pushViewController(homeVc, animated: true)
    }
    
}
