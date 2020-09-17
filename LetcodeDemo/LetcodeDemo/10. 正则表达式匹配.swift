//
//  10. 正则表达式匹配.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/16.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution10 {
    static func isMatch(_ s: String, _ p: String) -> Bool {
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
