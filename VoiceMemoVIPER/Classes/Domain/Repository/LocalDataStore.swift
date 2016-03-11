//
//  LocalDataStore.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

class LocalDataStore {
    var databaseManager: DatabaseManager?
    
    static let shareLocalDataStore = LocalDataStore()
    
    init() {
        databaseManager = DatabaseManager()
    }
    
    func getAllCreatedContact () -> [Contact] {
        let contacts = databaseManager?.getAllContacts()
        return contacts!
    }
    func addContacts(contact: [Contact]?) {
        
    }
}