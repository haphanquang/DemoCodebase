//
//  ContactListView.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

protocol ContactListView {
    func beginDownloadingContact()
    func finishDownloadingContact()
    func beginGettingContact()
    func finishGettingContact()
}