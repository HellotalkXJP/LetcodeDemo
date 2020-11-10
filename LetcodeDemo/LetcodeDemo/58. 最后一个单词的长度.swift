//
//  58. 最后一个单词的长度.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/5.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution58 {
    func lengthOfLastWord(_ s: String) -> Int {
        /*
         58. 最后一个单词的长度
         给定一个仅包含大小写字母和空格 ' ' 的字符串 s，返回其最后一个单词的长度。如果字符串从左向右滚动显示，那么最后一个单词就是最后出现的单词。
         如果不存在最后一个单词，请返回 0 。
         说明：一个单词是指仅由字母组成、不包含任何空格字符的 最大子字符串。
         示例:
         输入: "Hello World"
         输出: 5

         解题思路：
         1、从后遍历，找到单词的头部
         2、如果字符为空且长度等于0，继续遍历，如果字符为空且长度大于0，则跳出循环
         **/
        var length = 0
        for char in s.reversed() {
            if String(char) != " " {
                length += 1
            }
            
            if String(char) == " " && length > 0 {
                break
            }
        }
        
        return length
    }
}
