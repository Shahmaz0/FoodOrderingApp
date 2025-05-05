//
//  UIView+Extensions.swift
//  Practice
//
//  Created by $HahMa on 25/04/25.
//

import UIKit

extension UIView {
    @IBInspectable var cornarRadius: CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
