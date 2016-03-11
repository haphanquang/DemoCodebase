//
//  ContactListVC.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import UIKit

class ContactListVC: UIViewController {
    
    var contactListVM: ContactListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
}

extension ContactListVC: ContactListView {
    func beginDownloadingContact() {
        
    }
    func finishDownloadingContact() {
        
    }
    func beginGettingContact() {
        
    }
    func finishGettingContact() {
        
    }
}

extension ContactListVC: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let vm = contactListVM {
             return vm.contacts.value.count
        }else{
            return 0
        }
       
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let vm = contactListVM {
            let cell = tableView.dequeueReusableCellWithIdentifier(<#T##identifier: String##String#>)
        }
    }
}

extension ContactListVC: UITableViewDelegate {
    
}