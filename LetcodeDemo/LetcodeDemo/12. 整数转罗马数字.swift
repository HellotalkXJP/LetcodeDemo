//
//  12. 整数转罗马数字.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution12 {
    static func intToRoman(_ num: Int) -> String {
        // 1994 MCMXCIV
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var string = ""
        var tempNum = num
        
        for (index, value) in values.enumerated() {
            while tempNum >= value {
                tempNum = tempNum - value
                string += romans[index]
            }
        }
        
        
        return string
    }
}
