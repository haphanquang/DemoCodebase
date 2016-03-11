//
//  GetContactMemoUsecase.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation

class GetContactMemoUseCase: BaseUseCase{
    var localDataStore: LocalDataStore = LocalDataStore.shareLocalDataStore
    
    override func start() {
        preExecutor()
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) { [unowned self] in
            // do some task
            
            let result = self.localDataStore.getAllCreatedContact()
            
            dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                // update some UI
                self.afterExecutor(result)
            }
            
        }
    }
    
}