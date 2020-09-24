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
         ()[]{}  ==> true
         (]      ==> false
         ([)]    ==> false
         思路：
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
