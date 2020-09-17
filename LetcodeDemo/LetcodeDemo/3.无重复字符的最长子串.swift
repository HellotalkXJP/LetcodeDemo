//
//  3. 无重复字符的最长子串.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/8.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution3 {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
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
