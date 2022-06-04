//
//  FairyTalePresenter.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import FirebaseDatabase
import Service
class FairyTalePresenter {
    
    weak var view: FairyTaleView?
    weak var router: FairyTaleRouter?
    var ref: DatabaseReference! = Database.database().reference()
    
    private var taleArray = [ItemModal]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    func didLoad() {

        getAllFairyTales { itemModal in
            self.taleArray = itemModal
            self.view?.hideLoader()
        } onError: { error in
            self.view?.hideLoader()
            self.view?.showAlert(title: "Opss..", message: Localizables.Language.noInternet, actions: nil)

        }

    }
    
    func getAllFairyTales(completion: @escaping ([ItemModal]) -> Void, onError: @escaping(_ error: Error?) -> Void) {
        view?.showLoader()
        var fairyArray = [ItemModal]()
        ref.child(Globals.selectedLanguageCode.rawValue).child("tale").getData { err, snapshot in
            if let error = err {
                onError(error)
            } else {
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? DataSnapshot {
                    guard let data = try? JSONSerialization.data(withJSONObject: rest.value as Any, options: []) else { return }
                    if let itemModal = try? JSONDecoder().decode(ItemModal.self, from: data) {
                        fairyArray.append(itemModal)
                    }
                }
               completion(fairyArray)
            }
        }
    }
    
    func getTaleArray() -> [ItemModal] {
        return taleArray
    }
    
    func getTaleArrayCount() -> Int {
        return taleArray.count
    }
    
    func getTaleItemAtIndexPath(indexPath: IndexPath) -> ItemModal {
        return taleArray[indexPath.row]
    }
    
    
}
