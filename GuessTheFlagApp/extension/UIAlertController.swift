//
//  UIAlertController.swift
//  GuessTheFlagApp
//
//  Created by Kiran Sonne on 08/07/22.
//

import Foundation
import UIKit

extension UIAlertController{
    func setTitleColor(color: UIColor?){
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        if let titleColor = color{
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],
                                                     range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")
    }
}
 
