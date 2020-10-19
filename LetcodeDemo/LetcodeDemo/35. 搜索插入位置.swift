//
//  35. 搜索插入位置.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        /*
         给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
         你可以假设数组中无重复元素。
         示例 1:
         输入: [1,3,5,6], 5
         输出: 2
         
         示例 2:
         输入: [1,3,5,6], 2
         输出: 1
         
         解题思路：二分查找
         **/
        let nums = [1,3,5,6]
        let target = 0
        
        if nums.count == 0 {
            return 0
        }
        
        var left = 0, right = nums.count - 1, index = nums.count
        
        while left <= right {
            let mid = (left + right) / 2
            if target > nums[mid] {
                left = mid + 1
            } else {
                // target <= nums[mid]
                index = mid
                right = mid - 1
            }
        }
        
        return index
    }
}
