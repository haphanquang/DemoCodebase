//
//  QHTableViewCell.swift
//  RestaurantX
//
//  Created by Quang Ha on 2/27/16.
//  Copyright © 2016 Soyo. All rights reserved.
//

import Foundation
import UIKit

class QHTableViewCell: UITableViewCell {
    
    var cellHeight: CGFloat = 44.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutMargins = UIEdgeInsetsZero
    }
    
    class func autoCreateFromNib <T: AnyObject> () -> T?{
        let nibName = QHTableViewCell.getName(T.self)
        
        let nibArray = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
        
//        let nib = UINib(nibName: nibName, bundle: nil)
        
        
        let cell = nibArray[0] as? T
        return cell
    }
    
    class func getName(classType: AnyClass) -> String {
        
        let classString = NSStringFromClass(classType.self)
        let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
        return classString.substringFromIndex(range!.endIndex)
    }

}

typealias ExpandingCompletion = (selectedIndex: Int, source: [AnyObject]) -> ()

class ExpandingCell: QHTableViewCell {
    var expandingCompletion: ExpandingCompletion?
    var source: [AnyObject] = []
    var titleKey: String?
    let expandingHeight: CGFloat = 170.0
    
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imgIndicator: UIImageView!
    
    var isExpanding: Bool = false {
        didSet {
            pickerView.hidden = !isExpanding
            rotateIndicator()
        }
    }
    
    override func awakeFromNib() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.hidden = true
        
        imgIndicator.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        
        clipsToBounds = true
    }
    
    func showData(source: [AnyObject], titleKey: String, selectedIndex: Int, completion: ExpandingCompletion) {
        self.titleKey = titleKey
        self.source.removeAll()
        self.source.appendContentsOf(source)
        self.expandingCompletion = completion
        
        pickerView.reloadAllComponents()
        pickerView.selectRow(selectedIndex, inComponent: 0, animated: false)
    }
    
    func rotateIndicator () {
        let angle = isExpanding ? M_PI_2 : -M_PI_2
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = NSNumber(double: angle)
        animation.duration = 0.2
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        
        if isExpanding {
            imgIndicator.layer.addAnimation(animation, forKey: "rotateMe")
        }else{
            imgIndicator.layer.addAnimation(animation, forKey: "reverseMe")
        }
    }
    
}

extension ExpandingCell: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
}
extension ExpandingCell: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let data = source[row]
        if let titleKey = self.titleKey {
            lblContent.text = data.valueForKey(titleKey) as? String
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
    
        
        var lbl: UILabel
        
        if let label = view as? UILabel {
            lbl = label
        }else{
            let label = UILabel()
            lbl = label
        }
        
        lbl.font = UIFont.systemFontOfSize(20)
        lbl.textAlignment = .Center
        
        let data = source[row]
        if let titleKey = self.titleKey {
            lbl.text = data.valueForKey(titleKey) as? String
        }
        
        return lbl
        
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
}