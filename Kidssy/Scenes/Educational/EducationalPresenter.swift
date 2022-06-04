//
//  EducationalPresenter.swift
//  FairyTales
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import FirebaseDatabase
import Service
class EducationalPresenter {
    
    weak var view: EducationalView?
    weak var router: EducationalRouter?
    var ref: DatabaseReference! = Database.database().reference()
    
    private var educationalArray = [ItemModal]() {
        didSet {
            view?.updateTableView()
        }
    }
    
    func didLoad() {

        getAllEducational { itemModal in
            self.educationalArray = itemModal
            self.view?.hideLoader()
        } onError: { error in
            self.view?.hideLoader()
            self.view?.showAlert(title: "Opss..", message: Localizables.Language.noInternet, actions: nil)

        }
    }
    
    func getAllEducational(completion: @escaping ([ItemModal]) -> Void, onError: @escaping(_ error: Error?) -> Void) {
        view?.showLoader()
        var educationalArray = [ItemModal]()

        ref.child(Globals.selectedLanguageCode.rawValue).child("educational").getData { err, snapshot in
            if let error = err {
                onError(error)
            } else {
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? DataSnapshot {
                    guard let data = try? JSONSerialization.data(withJSONObject: rest.value as Any, options: []) else { return }
                    if let itemModal = try? JSONDecoder().decode(ItemModal.self, from: data) {
                        educationalArray.append(itemModal)
                    }
                }
                completion(educationalArray)
            }
        }
        
    }
    
    func getEducationalArray() -> [ItemModal] {
        return educationalArray
    }
    
    func getEducationalArrayCount() -> Int {
        return educationalArray.count
    }
    
    func getEducationalItemAtIndexPath(indexPath: IndexPath) -> ItemModal {
        return educationalArray[indexPath.row]
    }
}
