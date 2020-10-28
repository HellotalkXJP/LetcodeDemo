//
//  38. 外观数列.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution38 {
    func countAndSay(_ n: Int) -> String {
        /*
         38. 外观数列
         给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。
         注意：整数序列中的每一项将表示为一个字符串。
         「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：
         1.     1
         2.     11
         3.     21
         4.     1211
         5.     111221
         第一项是数字 1
         描述前一项，这个数是 1 即 “一个 1 ”，记作 11
         描述前一项，这个数是 11 即 “两个 1 ” ，记作 21
         描述前一项，这个数是 21 即 “一个 2 一个 1 ” ，记作 1211
         描述前一项，这个数是 1211 即 “一个 1 一个 2 两个 1 ” ，记作 111221

         示例 1:
         输入: 1
         输出: "1"
         解释：这是一个基本样例。
         
         示例 2:
         输入: 4
         输出: "1211"
         解释：当 n = 3 时，序列是 "21"，其中我们有 "2" 和 "1" 两组，"2" 可以读作 "12"，也就是出现频次 = 1 而 值 = 2；类似 "1" 可以读作 "11"。所以答案是 "12" 和 "11" 组合在一起，也就是 "1211"。

         解题思路：
         遍历字符串数数，拼接字符串 "\(count)\(char)"
         详细见代码中的注释，代码比较简单，好理解
         **/
        var defaultStr = "1"
        if n == 1 {
            return defaultStr
        }
        
        for _ in 1..<n {
            let tempStr = defaultStr
            var start = 0
            var count = 0
            var str = ""
            
            for (i, char) in tempStr.enumerated() {
                let index = tempStr.index(tempStr.startIndex, offsetBy: start)

                if tempStr[index] == char {
                    // 字符相同则数量+1
                    count += 1
                } else {
                    // 字符不相同，则先拼接字符串，再重置start和count的值
                    str += "\(count)\(tempStr[index])"
                    count = 1
                    start = i
                }
            }
            // 处理最后一个字符串的情况，如果最后一个字符串跟前一个字符相同，count+1，退出里面那一层循环，于是拼接的字符串就是"\(count)\(tempStr[index])"；如果最后一个字符与之前的字符不相同，则count=1，start为最后的位置，于是拼接字符串就是"\(count)\(tempStr[index])"
            let index = tempStr.index(tempStr.startIndex, offsetBy: start)
            str += "\(count)\(tempStr[index])"
            
            defaultStr = str
        }
        
        return defaultStr
    }
}
