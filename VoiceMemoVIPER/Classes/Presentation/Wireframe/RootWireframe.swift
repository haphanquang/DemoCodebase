//
//  RootWireframe.swift
//  VoiceMemoVIPER
//
//  Created by Quang Ha on 3/8/16.
//  Copyright © 2016 QH. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {
    
    func showRoot(viewController: UIViewController, window: UIWindow) {
        if let nav = self.navigationControllerFrom(window) {
            nav.viewControllers = [viewController]
        }
    }
    
    func navigationControllerFrom(window: UIWindow) -> UINavigationController? {
        if let navigation = window.rootViewController as? UINavigationController {
            return navigation
        }else{
            return nil
        }
    }
}