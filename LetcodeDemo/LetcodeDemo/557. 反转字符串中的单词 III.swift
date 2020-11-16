//
//  557. 反转字符串中的单词 III.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution557 {
    func reverseWords(_ s: String) -> String {
        /*
         557. 反转字符串中的单词 III
         给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

         示例：
         输入："Let's take LeetCode contest"
         输出："s'teL ekat edoCteeL tsetnoc"
          
         提示：
         在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

         解题思路：
         直接从后往前遍历字符串。判断非空格字符，直接加到中间变量temp中，每次遍历到空格时，就把temp插入到result的最前面位置，然后重置temp。最后遍历结束退出while循环后，处理下最后一个单词，直接把temp插入到result最前面就可以了。
         **/
        var result = ""
        var temp = ""
        var index = s.endIndex
        
        while index != s.startIndex {
            index = s.index(before: index)
            if s[index] == " " {
                result.insert(contentsOf: " " + temp, at: result.startIndex)
                temp = ""
            } else {
                temp.append(s[index])
            }
        }
        
        result.insert(contentsOf: temp, at: result.startIndex)
        return result

    }
}
