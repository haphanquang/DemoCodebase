//
//  DatabaseManager.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import FMDB

class DatabaseManager {
    static let DB_NAME = "vng_task_contact.db"
    static let DB_VERSION = "1.0"
    
    var database: FMDatabase?

    init () {
        generateDatabase()
        try! self.openDatabase()
    }
    
    func generateDatabase() {
        let path = NSBundle.mainBundle().pathForResource(DatabaseManager.DB_NAME, ofType: "")
        let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, false)[0]
        let dbPath = documentPath.stringByAppendingString("/v\(DatabaseManager.DB_VERSION)_\(DatabaseManager.DB_NAME)")
        
        let fileManager = NSFileManager()
        var isDirectory: ObjCBool = ObjCBool(false)
        
        if (fileManager.fileExistsAtPath(dbPath, isDirectory: &isDirectory)) {
            
        }else{
            do {
                try fileManager.copyItemAtPath(path!, toPath: dbPath)
            } catch {
                print("Cannot copy \(error)")
            }
        }
        
        database = FMDatabase(path: dbPath)
    }
    
    func openDatabase () throws {
        if let db = self.database {
            let successOpen = db.open()
            if !successOpen {
                throw DBError.CannotOpenDatabase
            }
        }
        
    }
    
    func getAllContacts() -> [Contact]{
        return ContactTable.getAllContacts(database!)
    }
    
    func saveContacts(contactList: [Contact]) {
        ContactTable.addContacts(database!, contacts: contactList)
    }
}