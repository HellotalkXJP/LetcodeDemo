//
//  最长回文子串.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution5 {
    /*
     5. 最长回文子串
     给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
     输入: "babad"
     输出: "bab"
     注意: "aba" 也是一个有效答案。
     
     
     
     **/
    func longestPalindrome(_ s: String) -> String {
        let array = convertArray(s)
        
        var maxString = ""
        var mx = 0
        var id = 0
        var p = [Int](repeating: 0, count: array.count)
        
        // babad
        // 0 1 2 3 4 5 6 7 8 9 10
        // # b # a # b # a # d #
        // 1 2 1 4 1 4 1 2 1 2 1
        for i in 0..<array.count {
            let j = 2 * id - i
            
            if mx > i {
                p[i] = mx > i ? min(p[j], mx - i) : 1
            } else {
                p[i] = 1
            }
            
            while (i - p[i]) >= 0 && i + p[i] < array.count && array[i + p[i]] == array[i - p[i]] {
                p[i] += 1
            }
            
            if i + p[i] > mx {
                mx = i + p[i]
                id = i
                var start = i - p[i] + 1
                var end = i + p[i] - 1
                
                start = start >= 0 ? start : 0
                end = end < array.count ? end : array.count - 1
                
                let tempStr = array[start...end].joined(separator: "")
                maxString = maxString.count > tempStr.count ? maxString : tempStr
            }
        }
        
        // 处理maxString
        return maxString.filter { (char) -> Bool in
            return String.init(char) != "#"
        }
    }
    
    func convertArray(_ s: String) -> Array<String> {
        var array = [String]()
        for char in s {
            array.append("#")
            array.append(String.init(char))
        }
        array.append("#")
        return array
    }
    
    // 动态规划
    /*
     dp对角线为true
     dp[i][j] = s[i] == s[j] && dp[i+1][j-1]
     当dp[i][j]==true时，计算出j-i+1回文子串的长度，比较maxLength，更新记录起始start以及maxLength，最后输出最大回文子串
     
        babad
        b   a   b   a   d
     b  T   F   T   F   F
     a      F   F   T   F
     b          T   F   F
     a              T   F
     d                  T
     
     **/
    func longestPalindrome1(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        let count = s.count
        var dp = Array(repeating: Array(repeating: false, count: count), count: count)
        for i in 0..<count {
            dp[i][i] = true
        }
        
        var start = 0
        var maxLength = 1
        for j in 1..<count {
            let s1 = s[s.index(s.startIndex, offsetBy: j)]
            for i in 0..<j {
                let s2 = s[s.index(s.startIndex, offsetBy: i)]
                if s1 != s2 {
                    dp[i][j] = false
                } else {
                    if j - i < 3 {
                        // 当s1==s2时，如果j-i<3，可以赋值true
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i+1][j-1]
                    }
                }
                
                if dp[i][j] && j - i + 1 > maxLength {
                    maxLength = j - i + 1
                    start = i
                }
            }
        }
        
        return String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: start + maxLength - 1)])
    }
}
