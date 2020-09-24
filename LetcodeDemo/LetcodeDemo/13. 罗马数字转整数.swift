//
//  13. 罗马数字转整数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution13 {
    static func romanToInt(_ s: String) -> Int {
        // MCMXCIV 1994
        let dict: [Character: Int] = ["M":1000, "D":500, "C":100, "L":50, "X":10, "V":5, "I":1]
        var result = 0
        var lastValue = 0
        
        for char in s {
            let value = dict[char] ?? 0
            result += value
            
            if value > lastValue {
                // MCM 1900
                // 第一次循环 M  value=1000 result=1000 lastValue=1000
                // 第二次循环 C  value=100 result=1100 lastValue=100
                // 第三次循环 M  value=1000 result=2100 lastValue<value 所以要把总的结果减去之前加的值result-lastValue，CM=M-C,所以result = result(1100) - lastValue(100) + value(1000) - lastValue(100) = 1900
                result -= 2 * lastValue
            }
            lastValue = value
        }
        
        return result
    }
}
