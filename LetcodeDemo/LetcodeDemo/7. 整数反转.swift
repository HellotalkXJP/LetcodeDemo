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
        /*
         7. 整数反转
         给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
         输入: 123
         输出: 321
         **/
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
