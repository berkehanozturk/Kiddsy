//
//  MusicPresenter.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import FirebaseDatabase
import Service

class MusicPresenter {
   
    
    weak var view: MusicView?
    weak var router: MusicRouter?
    var ref: DatabaseReference! = Database.database().reference()

    private var musicArray = [ItemModal]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    func didLoad() {

        getAllMusics { itemModal in
            self.musicArray = itemModal
            self.view?.hideLoader()
        } onError: { error in
            self.view?.hideLoader()
            self.view?.showAlert(title: "Opss..", message: Localizables.Language.noInternet, actions: nil)
        }
    }
     
    func getAllMusics(completion: @escaping ([ItemModal]) -> Void, onError: @escaping(_ error: Error?) -> Void) {
        view?.showLoader()
        var musicArray = [ItemModal]()
        ref.child(Globals.selectedLanguageCode.rawValue).child("music").getData { err, snapshot in
            if let error = err {
                onError(error)
            } else {
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? DataSnapshot {
                    guard let data = try? JSONSerialization.data(withJSONObject: rest.value as Any, options: []) else { return }
                    if let itemModal = try? JSONDecoder().decode(ItemModal.self, from: data) {
                        musicArray.append(itemModal)
                    }
                }
               completion(musicArray)
                
            }
        }
    }
    
    func getMusicArray() -> [ItemModal] {
        return musicArray
    }
    
    func getMusicArrayCount() -> Int {
        return musicArray.count
    }
    
    func getMusicItemAtIndexPath(indexPath: IndexPath) -> ItemModal {
        return musicArray[indexPath.row]
    }
    
    
}

