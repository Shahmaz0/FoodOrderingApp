//
//  UIViewController+Extension.swift
//  Practice
//
//  Created by $HahMa on 04/05/25.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        
    }
}
