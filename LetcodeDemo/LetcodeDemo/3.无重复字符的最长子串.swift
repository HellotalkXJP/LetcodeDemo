//
//  3. 无重复字符的最长子串.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/8.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        /*
         3. 无重复字符的最长子串
         给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
         输入: "abcabcbb"
         输出: 3
         解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
         
         解题思路:
         1、遍历字符串
         2、判断数组里面能否查找到当前字符，查到的话，重新计算maxCount，然后把数组当前位置前面的元素删掉，然后插入当前元素
         **/
        var array = [Character]()
        var maxCount = 0
        
        for char in s {
            if let index = array.firstIndex(of: char) {
                // 如果存在的话，则删除之前数组,并记录个数
                maxCount = max(maxCount, array.count)

                array.removeFirst(index + 1)

            }
            array.append(char)
        }
        return max(maxCount, array.count)
    }
}
