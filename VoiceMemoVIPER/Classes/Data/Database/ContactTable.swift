//
//  ContactTable.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import FMDB
import ObjectMapper

class ContactTable {
    static let TABLE_NAME = "Contact"
    
    enum ContactColumns: String {
        case ID = "id",
            TEXT = "text",
            SOUND_PATH = "sound_path",
            NUMBER = "number"
    }
    
    
//    static func generate(database: FMDatabase) {
//        var statement: String = "CREATE TABLE "
//        statement.appendContentsOf("\(TABLE_NAME) (")
//        statement.appendContentsOf("\(ContactColumns.ID) INTEGER PRIMARY KEY AUTOINCREMENT, ")
//        statement.appendContentsOf("\(ContactColumns.TEXT) VARCHAR, ")
//        statement.appendContentsOf("\(ContactColumns.SOUND_PATH) VARCHAR, ")
//        statement.appendContentsOf("\(ContactColumns.NUMBER) VARCHAR")
//        statement.appendContentsOf(")")
//        database.executeStatements(statement)
//    }
//    static func upgrade(database: FMDatabase, from: Int, to: Int) {
//        let statement: String = "DROP TABLE IF EXIST \(TABLE_NAME)"
//        database.executeStatements(statement)
//    }
    
    static func getAllContacts(database: FMDatabase) -> [Contact] {
        let query = "SELECT * FROM \(TABLE_NAME)"
        let resultSet = database.executeQuery(query, withParameterDictionary: [:])
        var resultArray:[Contact] = []
        
        while resultSet.next() {
            if let contact = Mapper<Contact>().map(resultSet.resultDictionary()) {
                resultArray.append(contact)
            }
        }
        
        return resultArray
    }
    
    static func addContacts(database: FMDatabase, contacts: [Contact]) {
        for contact in contacts {
            do {
                let insert = "INSERT INTO \(TABLE_NAME) (\(ContactColumns.TEXT),\(ContactColumns.SOUND_PATH), \(ContactColumns.NUMBER)) VALUES (?,?,?)"
                try database.executeUpdate(insert, values: [contact.text ?? NSNull(), contact.soundPath ?? NSNull(), contact.number ?? NSNull()])
            } catch {
                print("Cannot insert: \(error)")
            }
            
        }
    }
    
}