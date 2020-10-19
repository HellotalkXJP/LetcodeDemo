//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        /*
         34. 在排序数组中查找元素的第一个和最后一个位置
         给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
         你的算法时间复杂度必须是 O(log n) 级别。
         如果数组中不存在目标值，返回 [-1, -1]。
         示例 1:
         输入: nums = [5,7,7,8,8,10], target = 8
         输出: [3,4]
         
         示例 2:
         输入: nums = [5,7,7,8,8,10], target = 6
         输出: [-1,-1]
         
         解题思路：二分查找
         1、先找左边边界，由右侧逼近；
         2、在找右边界的时候，由左侧逼近。
         3、返回结果
         **/
        var res = Array(repeating: -1, count: 2)
        let count = nums.count
        if count == 0 {
            return res
        }
        var left = 0, right = count - 1
        while left < right {
            let mid = (left + right) / 2
            if target <= nums[mid] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        if nums[left] != target {
            return res
        }
        res[0] = left
        
        right = count
        while left < right {
            let mid = (left + right) / 2
            if target >= nums[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        res[1] = left - 1
        
        return res
    }
}
