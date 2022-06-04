//
//  LullabiesPresenter.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import FirebaseDatabase
import Service
class LullabiesPresenter {
    
    weak var view: LullabiesView?
    weak var router: LullabiesRouter?
    var ref: DatabaseReference! = Database.database().reference()
    
    private var lullabiesArray = [ItemModal]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    func didLoad() {

        getAllLullabies { itemModal in
            self.lullabiesArray = itemModal
            self.view?.hideLoader()
        } onError: { error in
            self.view?.hideLoader()
            self.view?.showAlert(title: "Opss..", message: Localizables.Language.noInternet, actions: nil)

        }

    }
    
    func getAllLullabies(completion: @escaping ([ItemModal]) -> Void, onError: @escaping(_ error: Error?) -> Void) {
        view?.showLoader()
        var lullabiesArray = [ItemModal]()
        ref.child(Globals.selectedLanguageCode.rawValue).child("lullabies").getData { err, snapshot in
            if let error = err {
                onError(error)
            } else {
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? DataSnapshot {
                    guard let data = try? JSONSerialization.data(withJSONObject: rest.value as Any, options: []) else { return }
                    if let itemModal = try? JSONDecoder().decode(ItemModal.self, from: data) {
                        lullabiesArray.append(itemModal)
                    }
                }
               completion(lullabiesArray)
            }
        }
    }
    
    func getLullabiesArray() -> [ItemModal] {
        return lullabiesArray
    }
    
    func getLullabiesArrayCount() -> Int {
        return lullabiesArray.count
    }
    
    func getLullabiesItemAtIndexPath(indexPath: IndexPath) -> ItemModal {
        return lullabiesArray[indexPath.row]
    }
    
}
