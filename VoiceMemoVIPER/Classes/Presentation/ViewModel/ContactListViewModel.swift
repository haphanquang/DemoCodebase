//
//  ContactListViewModel.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/9/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import RxSwift

class ContactListViewModel: BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    var getContactUseCase: GetContactMemoUseCase?
    
    var contacts: Variable<[Contact]> = Variable([])
    
    override init() {
        
        super.init()
        self.createGetContactUseCase()
        contacts.asObservable().subscribeNext { (listContacts) -> Void in
            
        }.addDisposableTo(disposeBag)
    }
    
    func createGetContactUseCase () {
        let preExecutor: PreProcessingCallback = {
            //do nothing
        }
        
        let successExecutor: SuccessProcessingCallback = { result in
            //do nothing
            if let rs = result as? [Contact] {
                self.contacts.value.appendContentsOf(rs)
            }
        }
        
        let failureExecutor: FailureCallback = { error in
            //do nothing
        }
        
        let getContactMemoUseCase = GetContactMemoUseCase(pre: preExecutor, successExecutor: successExecutor, failureExecutor: failureExecutor)
        self.getContactUseCase = getContactMemoUseCase
    }
    
    func loadContactList () {
        getContactUseCase!.start()
    }
}