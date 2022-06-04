//
//  PlayViewController.swift
//  FairyTales
//
//  Created by Berkehan on 18.02.2022.
//

import UIKit
import UIComponents
import YouTubeiOSPlayerHelper
protocol PlayRouter: AnyObject {
    
}

protocol PlayView: BaseView {
    
}

class PlayViewController: BaseViewController {
    
    var presenter = PlayPresenter()
    
    @IBOutlet weak var youtubePlayerView: YTPlayerView!
    @IBOutlet weak var blueFrame: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.veryLightBlue
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        // Do any additional setup after loading the view.
        setupPlayerView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)

    }
    
    private func setupPlayerView() {
            youtubePlayerView.delegate = self
            blueFrame.superview?.bringSubviewToFront(blueFrame)
            let playerVars = presenter.getPlayerConfigs()
            guard let videoId = presenter.getSelectedVideoId() else {return}
            self.youtubePlayerView.load(withVideoId: videoId, playerVars: playerVars)
    }
}

extension PlayViewController: PlayView {
    
}

extension PlayViewController: PlayRouter {
    
}
extension PlayViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        if let startSec = Globals.selectedItem?.startTime {
            youtubePlayerView.seek(toSeconds: Float(startSec), allowSeekAhead: true)
        }
        youtubePlayerView.playVideo()
    
    }
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        if let endSec = Globals.selectedItem?.endTime {
            if playTime >= Float(endSec) {
                youtubePlayerView.stopVideo()
            }
        }
    }
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        switch state {
        case .ended:
            break
        default:
            break
        }
    }
    
    
}
