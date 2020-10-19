//
//  15. 三数之和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/18.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution15 {
    /*
     15. 三数之和
     给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

     注意：答案中不可以包含重复的三元组。

     给定数组 nums = [-1, 0, 1, 2, -1, -4]，

     满足要求的三元组集合为：
     [
       [-1, 0, 1],
       [-1, -1, 2]
     ]

     解题思路：
     1、先按从大到小排序，a+b+c=0 ==>a+b= -c
     2、重复过滤（如果值跟目标相等，则left右移，right左移；如果left的值跟后一个值相等，则left继续右移；如果right的值跟前一个值相等，则right继续左移）
     3、如果newNums[left] + newNums[right]大于目标值，说明sum要缩小，则right左移
     4、如果newNums[left] + newNums[right]小于目标值，说明sum要增大，则left右移
     5、循环结束，返回结果。
     **/
    static func threeSum(_ nums: [Int]) -> [[Int]] {
        // [-1, 0, 1, 2, -1, -4]
        // a + b + c = 0 => a + b = -c
//        let nums = [0,0,0,0]
//        let nums = [-2,0,1,1,2]
        var array = [[Int]]()
        
        // 先按从大到小排序
        let newNums = nums.sorted()
        let count = newNums.count - 1
        
        for (i, num1) in newNums.enumerated() {
            if i > 0 && newNums[i] == newNums[i - 1] {
                continue
            }
            
            let c = 0 - num1
            var left = i + 1
            var right = count
            
            while left < right {
                let sum = newNums[left] + newNums[right]
                if sum == c {
                    array.append([num1, newNums[left], newNums[right]])
                    // 如果left的值跟后一个值相等，则left继续右移
                    while left < right && newNums[left] == newNums[left+1] {
                        left += 1
                    }
                    
                    // 如果right的值跟前一个值相等，则right继续左移
                    while left < right && newNums[right] == newNums[right-1] {
                        right -= 1
                    }
                    // 如果值跟目标相等，则left右移，right左移
                    left += 1
                    right -= 1
                } else if sum > c {
                    // 如果newNums[left] + newNums[right]大于目标值，说明sum要缩小，则right左移
                    right -= 1
                } else {
                    // sum < c
                    // 如果newNums[left] + newNums[right]小于目标值，说明sum要增大，则left右移
                    left += 1
                }
            }
        }
        return array
    }
}
