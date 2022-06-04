//
//  FairyTaleViewController.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit
import UIComponents
protocol FairyTaleRouter: AnyObject {
    func gotoPlayerScreen()
}

protocol FairyTaleView: BaseView {
    func updateTableView()
}

class FairyTaleViewController: BaseViewController {
    
    var presenter = FairyTalePresenter()
    
    @IBOutlet weak var fairyTaleLabel: UILabel!{
        didSet {
            fairyTaleLabel.text = Localizables.Language.fairyTales.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
        
    }
    
    @IBOutlet weak var sleepWellLabel: UILabel! {
        didSet {
            sleepWellLabel.text = Localizables.Language.sleepWell.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var containerPurpleView: UIView!
    @IBOutlet weak var fairyTaleTableView: UITableView!
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
        containerPurpleView.layer.cornerRadius = containerPurpleView.frame.height * 0.12
        containerPurpleView.layer.shadowColor = UIColor.purple.cgColor
        containerPurpleView.layer.shadowOpacity = 0.2
        containerPurpleView.layer.shadowOffset = .zero
        containerPurpleView.layer.shadowRadius = 20
        containerPurpleView.layer.shadowPath = UIBezierPath(rect: containerPurpleView.bounds).cgPath
        containerPurpleView.layer.shouldRasterize = true
        containerPurpleView.layer.rasterizationScale = UIScreen.main.scale

    }
    
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        fairyTaleTableView.register(ItemCell.self)
        fairyTaleTableView.dataSource = self
        fairyTaleTableView.delegate = self
        fairyTaleTableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0);
        fairyTaleTableView.separatorStyle = .none
        fairyTaleTableView.rowHeight = view.frame.height / 6
      
    }
    
}

extension FairyTaleViewController: FairyTaleView {
    func showLoader() {
        startLoadingAtTargetView(view: fairyTaleTableView)

    }
    
    func hideLoader() {
        stopLoadingAtTargetView(view: fairyTaleTableView)
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.fairyTaleTableView.reloadData()
        }
    }
}

extension FairyTaleViewController: FairyTaleRouter {
    func gotoPlayerScreen() {
        let playVC = PlayModule.initModule()
        navigationController?.pushViewController(playVC, animated: true)
    }
}

extension FairyTaleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getTaleArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(item: presenter.getTaleItemAtIndexPath(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Globals.selectedItem = presenter.getTaleItemAtIndexPath(indexPath: indexPath)
        gotoPlayerScreen()
    }
    
}
