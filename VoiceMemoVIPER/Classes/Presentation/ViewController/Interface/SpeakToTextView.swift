//
//  SpeakToTextView.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/10/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

protocol SpeechToTextView {
    func beginGenerateText()
    func completeGenerateText(result: String)
}