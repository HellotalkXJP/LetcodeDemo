//
//  44. 通配符匹配.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/26.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution44 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        /*
         44. 通配符匹配
         给定一个字符串 (s) 和一个字符模式 (p) ，实现一个支持 '?' 和 '*' 的通配符匹配。
         '?' 可以匹配任何单个字符。
         '*' 可以匹配任意字符串（包括空字符串）。
         两个字符串完全匹配才算匹配成功。

         说明:
         s 可能为空，且只包含从 a-z 的小写字母。
         p 可能为空，且只包含从 a-z 的小写字母，以及字符 ? 和 *。
         示例 1:
         输入:
         s = "aa"
         p = "a"
         输出: false
         解释: "a" 无法匹配 "aa" 整个字符串。
         
         示例 2:
         输入:
         s = "aa"
         p = "*"
         输出: true
         解释: '*' 可以匹配任意字符串。
         
         解题思路：
         动态规划
         s长度为n，p长度为m，创建一个长度为table[n+1][m+1]
                 0      1   2   3   4   5   6
               start    a   d   c   b   e   b
         start   T
            a           T
            *           T   T   T   T   T   T           若p1==*，则判断顶上是否为true，若为true,则table这一行后面的元素都为true
            b                       T       T
            ?                           T
            b                               T
         
         只需要判断最后一个格子是否成功匹配
         
         **/
        
        let s = ""
        let p = "***"
//        let s = "aab"
//        let p = "c*a*b"
//        let s = ""
//        let p = "ab*"
//        let s = "ho"
//        let p = "**ho"
        
        let n = s.count
        let m = p.count
        
        var table = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        table[0][0] = true
        
        if String(p.first ?? " ") == "*" {
            table[1] = Array(repeating: true, count: n + 1)
        }
        

        for (i, char1) in p.enumerated() {
            var temp = false
            let p1 = String(char1)
            if s.count == 0 && p1 == "*" && table[i][0] {
                table[i+1][0] = true
                continue
            }
            
            for (j, char2) in s.enumerated() {
                let s1 = String(char2)
                if s1 == p1 || p1 == "?" {
                    table[i + 1][j + 1] = table[i][j]
                } else if p1 == "*" {
                    if table[i][0] {
                        table[i + 1] = Array(repeating: true, count: n + 1)
                        continue
                    }
                    
                    if table[i][j + 1] {
                        // 判断顶上是不是true
                        temp = true
                    }
                    if temp {
                        // 顶上为true的话，后面的值都为true
                        table[i + 1][j + 1] = true
                    }
                }
            }
        }
        
        return table[m][n]
    }
}
