//
//  MusicViewController.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import UIKit
import UIComponents

protocol MusicRouter: AnyObject {
    func gotoPlayerScreen()

}

protocol MusicView: BaseView {
    func updateTableView()
}

class MusicViewController: BaseViewController {

    var presenter = MusicPresenter()
    
    @IBOutlet weak var musicTableView: UITableView!
    
    @IBOutlet weak var musicLabel: UILabel! {
        didSet {
            musicLabel.text =  Localizables.Language.music.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var letsSongLabel: UILabel! {
        didSet {
            letsSongLabel.text =  Localizables.Language.letsSong.addLocalizableString(str: Globals.selectedLanguageCode.rawValue)
        }
    }
    
    @IBOutlet weak var containerPinkView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.presenter.didLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        super.viewWillAppear(true)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerPinkView.layer.cornerRadius = containerPinkView.frame.height * 0.12
        containerPinkView.layer.shadowColor = UIColor.pink.cgColor
        containerPinkView.layer.shadowOpacity = 0.2
        containerPinkView.layer.shadowOffset = .zero
        containerPinkView.layer.shadowRadius = 20
        containerPinkView.layer.shadowPath = UIBezierPath(rect: containerPinkView.bounds).cgPath
        containerPinkView.layer.shouldRasterize = true
        containerPinkView.layer.rasterizationScale = UIScreen.main.scale

    }
    
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        musicTableView.register(ItemCell.self)
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0);
        musicTableView.separatorStyle = .none
        musicTableView.rowHeight = view.frame.height / 6

    }
    
}

extension MusicViewController: MusicView {
    func showLoader() {
        startLoadingAtTargetView(view: musicTableView)

    }
    
    func hideLoader() {
        stopLoadingAtTargetView(view: musicTableView)
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.musicTableView.reloadData()
        }
    }
}

extension MusicViewController: MusicRouter {
    func gotoPlayerScreen() {
        let playVC = PlayModule.initModule()
        navigationController?.pushViewController(playVC, animated: true)
    }
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMusicArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(item: presenter.getMusicItemAtIndexPath(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Globals.selectedItem = presenter.getMusicItemAtIndexPath(indexPath: indexPath)
        gotoPlayerScreen()
    }
    
}
