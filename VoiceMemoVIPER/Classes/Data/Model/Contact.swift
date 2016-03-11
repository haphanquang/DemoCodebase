//
//  Contact.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import ObjectMapper

class Contact: Mappable {
    var id: Int?
    var text: String?
    var soundPath: String?
    var number: String?
 
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        soundPath <- map["sound_path"]
        number <- map ["number"]
    }
}