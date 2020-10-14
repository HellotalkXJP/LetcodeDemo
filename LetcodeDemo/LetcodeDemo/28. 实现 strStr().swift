//
//  28. 实现 strStr().swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        /*
         haystack = "hello"
         needle = "ll"
         解题思路:
         直接遍历，如果源字符串第一个字符与目标字符串第一个字符相等，则开始匹配，取出i+count的子字符串，与needle比较，如果相等，则返回i，否则进入下一次循环
         **/
        if needle.count == 0 {
            return 0
        }
        
        if haystack.count == 0 {
            return -1
        }
        
        let count = needle.count
        for (i, char) in haystack.enumerated() {
            if i > haystack.count - count {
                break
            }
            
            if char == needle.first {
                // 如果第一个字符相等，则取出i+count的子字符串，与needle比较，如果相等，则返回i，否则进入下一次循环
                let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
                let endIndex = haystack.index(startIndex, offsetBy: count)
                let string = String(haystack[startIndex..<endIndex])
                if string == needle {
                    return i
                }
            }
        }
        
        return -1
    }
}
