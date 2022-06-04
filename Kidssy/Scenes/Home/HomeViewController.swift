//
//  HomeViewController.swift
//  FairyTales
//
//  Created by Berkehan on 16.02.2022.
//

import UIKit
import UIComponents
protocol HomeRouter: AnyObject {
    func gotoMusicScreen()
    func gotoFairyTaleScreen()
    func gotoEducationalScreen()
    func gotoLullabiesScreen()

}

protocol HomeView: BaseView {
    
}

class HomeViewController: BaseViewController {
    
    var presenter = HomePresenter()
    
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        self.navigationController?.navigationBar.isHidden = false

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    /// setup views or necessary fields
    func setup() {
        setupTableView()
        navigationController?.navigationBar.barTintColor = UIColor.White

    }
    
    /// Setup Table View configration
    func setupTableView() {
        homeTableView.register(HomeCell.self)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0);
        homeTableView.separatorStyle = .none
        homeTableView.rowHeight = view.frame.height / 4
    }
    
}

extension HomeViewController: HomeView {
    
   
}

extension HomeViewController: HomeRouter {
    func gotoFairyTaleScreen() {
        let fairyVc = FairyTaleModule.initModule()
        navigationController?.pushViewController(fairyVc, animated: true)
    }
    
    func gotoEducationalScreen() {
        let educationalVc = EducationalModule.initModule()
        navigationController?.pushViewController(educationalVc, animated: true)
    }
    
    func gotoLullabiesScreen() {
        let lullabiesVc = LullabiesModule.initModule()
        navigationController?.pushViewController(lullabiesVc, animated: true)
    }
    
    func gotoMusicScreen() {
        let musicVc = MusicModule.initModule()
        navigationController?.pushViewController(musicVc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getHomeDataArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell =  tableView.dequeueReusableCell(for: indexPath)
        cell.setData(homeItem: presenter.getHomeItemAtIndexPath(indexPath: indexPath),selectedLanguageKey: Globals.selectedLanguageCode.rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.chooseScreen(indexPath: indexPath)
       
    }
}
