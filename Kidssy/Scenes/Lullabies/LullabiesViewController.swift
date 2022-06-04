//
//  LullabiesViewController.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit
import UIComponents
protocol LullabiesRouter: AnyObject {
    func gotoPlayerScreen()

}

protocol LullabiesView: BaseView {
    func updateTableView()
}

class LullabiesViewController: BaseViewController {
    
    var presenter = LullabiesPresenter()
    
    @IBOutlet weak var lullabiesLabel: UILabel! {
        didSet {
            lullabiesLabel.text = Localizables.Language.lullabies.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var sleepLabel: UILabel! {
        didSet {
            sleepLabel.text = Localizables.Language.lullabieSleep.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var blueContainerView: UIView!
    @IBOutlet weak var lullabiesTableView: UITableView!
    
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
        blueContainerView.layer.cornerRadius = blueContainerView.frame.height * 0.12
        blueContainerView.layer.shadowColor = UIColor.black.cgColor
        blueContainerView.layer.shadowOpacity = 0.1
        blueContainerView.layer.shadowOffset = .zero
        blueContainerView.layer.shadowRadius = 20
        blueContainerView.layer.shadowPath = UIBezierPath(rect: blueContainerView.bounds).cgPath
        blueContainerView.layer.shouldRasterize = true
        blueContainerView.layer.rasterizationScale = UIScreen.main.scale

    }

    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        lullabiesTableView.register(ItemCell.self)
        lullabiesTableView.dataSource = self
        lullabiesTableView.delegate = self
        lullabiesTableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0);
        lullabiesTableView.separatorStyle = .none
        lullabiesTableView.rowHeight = view.frame.height / 6
    }
    
}

extension LullabiesViewController: LullabiesView {
    func showLoader() {
        startLoadingAtTargetView(view: lullabiesTableView)

    }
    
    func hideLoader() {
        stopLoadingAtTargetView(view: lullabiesTableView)
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.lullabiesTableView.reloadData()
        }
    }
}

extension LullabiesViewController: LullabiesRouter {
    func gotoPlayerScreen() {
        let playVC = PlayModule.initModule()
        navigationController?.pushViewController(playVC, animated: true)
    }
}

extension LullabiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getLullabiesArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(item: presenter.getLullabiesItemAtIndexPath(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Globals.selectedItem = presenter.getLullabiesItemAtIndexPath(indexPath: indexPath)
        gotoPlayerScreen()
    }
}
