//
//  BaseVC.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/10/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    class func loadFromStoryBoard <T: AnyObject> (sbName: String) -> T?{
        let identifier = BaseVC.getName(T.self)
        let sb = UIStoryboard(name: sbName, bundle: nil)
        return sb.instantiateViewControllerWithIdentifier(identifier) as? T
    }
    
    class func getName(classType: AnyClass) -> String {
        let classString = NSStringFromClass(classType.self)
        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
        return classString.substringFromIndex(range!.endIndex)
    }
}