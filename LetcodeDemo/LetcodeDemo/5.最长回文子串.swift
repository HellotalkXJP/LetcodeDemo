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
}
