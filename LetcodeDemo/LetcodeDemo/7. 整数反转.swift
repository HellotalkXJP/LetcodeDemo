//
//  7. 整数反转.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution7 {
    static func reverse(_ x: Int) -> Int {
        
        let str = "\(x)"
        var intStr = ""
        if str.hasPrefix("-") {
            intStr = "-"
        }
        
        for char in str.reversed() {
            if String(char) != "-" {
                intStr += String(char)
            }
        }
        
        let value = Int(intStr) ?? 0
        
        return value > Int32.max || value < Int32.min ? 0 : value
    }
}
