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
        /*
         13. 罗马数字转整数
         罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
         字符          数值
         I             1
         V             5
         X             10
         L             50
         C             100
         D             500
         M             1000

         例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

         通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

         I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
         X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
         C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
         给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

         输入: "III"
         输出: 3
         
         输入: "LVIII"
         输出: 58
         解释: L = 50, V= 5, III = 3.
         **/
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
