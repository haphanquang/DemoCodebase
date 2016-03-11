//
//  BaseUseCase.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

typealias PreProcessingCallback = () -> ()
typealias SuccessProcessingCallback = (Any) -> ()
typealias FailureCallback = (ErrorType) -> ()

class BaseUseCase {
    
    var preExecutor: PreProcessingCallback
    var successExecutor: SuccessProcessingCallback
    var failureExecutor: FailureCallback
    
    init(pre preExecutor: PreProcessingCallback, successExecutor: SuccessProcessingCallback, failureExecutor: FailureCallback) {
        self.preExecutor = preExecutor
        self.successExecutor = successExecutor
        self.failureExecutor = failureExecutor
    }
    
    func start() {
        
    }
}