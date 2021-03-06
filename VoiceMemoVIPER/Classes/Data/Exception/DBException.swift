//
//  DBException.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/9/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

enum DBError: ErrorType {
    case CannotOpenDatabase
    case CannotQuery
    case CannotUpdateDatabase
}