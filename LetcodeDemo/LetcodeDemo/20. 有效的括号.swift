//
//  20. 有效的括号.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/24.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution20 {
    func isValid(_ s: String) -> Bool {
        /*
         20. 有效的括号
         给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

         有效字符串需满足：

         左括号必须用相同类型的右括号闭合。
         左括号必须以正确的顺序闭合。
         注意空字符串可被认为是有效字符串。

         输入: "()"
         输出: true
         
         输入: "([)]"
         输出: false
         
         ()[]{}  ==> true
         (]      ==> false
         ([)]    ==> false
         解题思路：
         因为是字符串里面没有其他字符，所以可以匹配"()"、"{}"、"[]"，然后替换成空字符串""，最后判断字符串是否是空字符串
         **/
        if s.count % 2 != 0 {
            // 字符串个数必须偶数，奇数的话，直接返回false。
            return false
        }
        var tempS = s
        while tempS.contains("()") || tempS.contains("{}") || tempS.contains("[]") {
            tempS = tempS.replacingOccurrences(of: "()", with: "")
            tempS = tempS.replacingOccurrences(of: "{}", with: "")
            tempS = tempS.replacingOccurrences(of: "[]", with: "")
        }
        
        return tempS.isEmpty
    }
}
