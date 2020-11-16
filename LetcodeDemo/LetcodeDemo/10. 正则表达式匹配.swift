//
//  10. 正则表达式匹配.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/16.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution10 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        /*
         10. 正则表达式匹配
         给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。
         '.' 匹配任意单个字符
         '*' 匹配零个或多个前面的那一个元素
         说明:

         s 可能为空，且只包含从 a-z 的小写字母。
         p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
         
         输入:
         s = "aa"
         p = "a"
         输出: false
         解释: "a" 无法匹配 "aa" 整个字符串。
         **/
        if p.isEmpty {
            return s.isEmpty
        }
        
        let firstMatch = !s.isEmpty && (s.first == p.first || p.first == ".")
        
        if p.count >= 2 && p[p.index(after: p.startIndex)] == "*" {
            let index = p.index(p.startIndex, offsetBy: 2)
            
            // 匹配0个字符
            let bool1 = isMatch(s, String(p[index..<p.endIndex]))
            
            // 匹配多个前面的字符
            let bool2 = firstMatch && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), p)
            
            return bool1 || bool2
        } else {
//            if firstMatch {
//                let sStartIndex = s.index(s.startIndex, offsetBy: 1)
//                let pStartIndex = p.index(p.startIndex, offsetBy: 1)
//                return isMatch(String(s[sStartIndex..<s.endIndex]), String(p[pStartIndex..<p.endIndex]))
//            } else {
//                return false
//            }
            return firstMatch && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), String(p[p.index(p.startIndex, offsetBy: 1)..<p.endIndex]))
        }
    }
}
