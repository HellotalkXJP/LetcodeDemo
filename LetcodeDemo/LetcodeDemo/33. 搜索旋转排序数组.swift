//
//  33. 搜索旋转排序数组.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        /*
         33. 搜索旋转排序数组
         给你一个升序排列的整数数组 nums ，和一个整数 target 。
         假设按照升序排序的数组在预先未知的某个点上进行了旋转。（例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] ）。
         请你在数组中搜索 target ，如果数组中存在这个目标值，则返回它的索引，否则返回 -1。
         示例 1：
         输入：nums = [4,5,6,7,0,1,2], target = 0
         输出：4
         
         示例 2：
         输入：nums = [4,5,6,7,0,1,2], target = 3
         输出：-1

         解题思路：二分查找
         1、比较中间的值nums[mid]与最右边的值nums[right]，若nums[mid]<nums[right]，则右半部分是有序的。若nums[mid]>nums[right]，则左半部分是有序的
         2、在有序的部分里，比较左右2个值，判断目标值是否在这个区域里，在的话，则保留这个区域，left=mid+1；如果不在这个区域，则right=mid-1
         3、循环以上步骤，直接结束
         4、返回结果
         **/
        let nums = [4,5,6,7,0,1,2]
        let target = 0
        let count = nums.count
        if count == 0 {
            return -1
        }
        if count == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        var left = 0, right = count - 1
        while left <= right {
            let mid = (right + left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < nums[right] {
                // 右半部分有序
                if target > nums[mid] && target <= nums[right] {
                    // 在右半部分区域里
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                // nums[mid] > nums[right] ==> 左半部分有序
                if target >= nums[left] && target < nums[mid] {
                    // 在左半部分区域
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}
