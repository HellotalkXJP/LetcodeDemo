//
//  27. 移除元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        /*
         27. 移除元素
         给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
         不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
         元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
         示例：
         给定 nums = [3,2,2,3], val = 3,
         函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
         你不需要考虑数组中超出新长度后面的元素。

         解题思路：
         直接遍历数组，遇到相同的值，跳过;相同则i+1
         **/
        if nums.count == 0 {
            return 0
        }
        var i = 0
        let length = nums.count
        
        for index in 0..<length {
            if nums[index] != val {
                nums[i] = nums[index]
                i += 1
            }
        }
        
        return i
    }
}
