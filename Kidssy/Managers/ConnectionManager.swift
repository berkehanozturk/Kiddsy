//
//  ConnectionManager.swift
//  FairyTales
//
//  Created by Berkehan on 20.02.2022.
//

import Foundation
import Reachability
class ConnectionManager {
    
    static let sharedInstance = ConnectionManager()
    private var reachability : Reachability!
    
    func observeReachability(){
        do {
            self.reachability = try Reachability()
            
        }
        catch(let error) {
            print("Error occured initing reachability  : \(error.localizedDescription)")
            
        }
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    func getCurrentInternetState() -> Bool {
        do {
            self.reachability = try Reachability()
            let connection = reachability.connection
            switch connection {
            case .cellular, .wifi:
                return true
            case .none, .unavailable :
                return false
    
            }
        }
        catch(let error) {
            print("Error occured initing reachability  : \(error.localizedDescription)")
            return false
        }
    }
}
