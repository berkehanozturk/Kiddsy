//
//  EducationalViewController.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit
import UIComponents
import Service
protocol EducationalRouter: AnyObject {
    func gotoPlayerScreen()

}

protocol EducationalView: BaseView {
    func updateTableView()
}

class EducationalViewController: BaseViewController {
    
    var presenter = EducationalPresenter()
    
    @IBOutlet weak var educationalLabel: UILabel! {
        didSet {
            educationalLabel.text = Localizables.Language.educational.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var learnLabel: UILabel! {
        didSet {
            learnLabel.text = Localizables.Language.learn.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var educationTableView: UITableView!
    @IBOutlet weak var greenContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.didLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)

        super.viewWillAppear(true)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenContainerView.layer.cornerRadius = greenContainerView.frame.height * 0.12
        greenContainerView.layer.shadowColor = UIColor.green.cgColor
        greenContainerView.layer.shadowOpacity = 0.2
        greenContainerView.layer.shadowOffset = .zero
        greenContainerView.layer.shadowRadius = 20
        greenContainerView.layer.shadowPath = UIBezierPath(rect: greenContainerView.bounds).cgPath
        greenContainerView.layer.shouldRasterize = true
        greenContainerView.layer.rasterizationScale = UIScreen.main.scale

    }

    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        educationTableView.register(ItemCell.self)
        educationTableView.dataSource = self
        educationTableView.delegate = self
        educationTableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0);
        educationTableView.separatorStyle = .none
        educationTableView.rowHeight = view.frame.height / 6
    }
}

extension EducationalViewController: EducationalView {
    func showLoader() {
        startLoadingAtTargetView(view: educationTableView)

    }
    
    func hideLoader() {
        stopLoadingAtTargetView(view: educationTableView)
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.educationTableView.reloadData()
        }
    }
}

extension EducationalViewController: EducationalRouter {
    func gotoPlayerScreen() {
        let playVC = PlayModule.initModule()
        navigationController?.pushViewController(playVC, animated: true)
    }
}

extension EducationalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getEducationalArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(item: presenter.getEducationalItemAtIndexPath(indexPath: indexPath))

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Globals.selectedItem = presenter.getEducationalItemAtIndexPath(indexPath: indexPath)
        gotoPlayerScreen()
    }
}
