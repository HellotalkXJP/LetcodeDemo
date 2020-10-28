//
//  43. 字符串相乘.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/23.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution43 {
    func multiply(_ num1: String, _ num2: String) -> String {
        /*
         43. 字符串相乘
         给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
         示例 1:
         输入: num1 = "2", num2 = "3"
         输出: "6"
         
         示例 2:
         输入: num1 = "123", num2 = "456"
         输出: "56088"
         
         解题思路：
         n位数 * m位数得到的乘积值，最多为 n + m位，例如999 * 99 = 99998， 100 * 10 = 1000
         1、初始化一个长度为n+m的数组
         2、根据下面的列式可以得到，
         sum = res[i + j + 1] + n1 * n2,
         res[i + j + 1] = sum % 10,
         res[i + j] += sum / 10
         具体可以看下面的的列式。
                       1  2  3
                   X   4  5  6
            -------------------
                          1  8
                       1  2
                    0  6
            -------------------
          =         0  7  3  8
                       1  5
                    1  0
                 0  5
            -------------------
                    1  2
                 0  8
              0  4
            -------------------
          =   0  5  6  0  8  8
        res   0  1  2  3  4  5
         
         **/
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var res = Array.init(repeating: 0, count: num1.count + num2.count)
        for i in stride(from: num2.count - 1, through: 0, by: -1) {
            let char1 = num2[num2.index(num2.startIndex, offsetBy: i)]
            for j in stride(from: num1.count - 1, through: 0, by: -1) {
                let char2 = num1[num1.index(num1.startIndex, offsetBy: j)]
                let n1 = Int(String(char1)) ?? 0
                let n2 = Int(String(char2)) ?? 0
                
                let sum = res[i + j + 1] + n1 * n2
                res[i + j + 1] = sum % 10
                res[i + j] += sum / 10
            }
        }
        
        var result = ""
        for (index, value) in res.enumerated() {
            if value == 0 && index == 0 {
                continue
            }
            
            result += "\(value)"
        }
        
        return result
    }
}
