//
//  String+Extension.swift
//  Practice
//
//  Created by $HahMa on 03/05/25.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
