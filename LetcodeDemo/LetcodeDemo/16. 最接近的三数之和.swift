//
//  16. 最接近的三数之和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/18.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution16 {
    static func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        // [-1,2,1,-4]   1
        /*
         16. 最接近的三数之和
         给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

         输入：nums = [-1,2,1,-4], target = 1
         输出：2
         解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
         
         根据三个数字之和的算法思路。
         1、使用2个指针(left、right)
         2、原数组先按从大到小排序
         3、判断 sum = a + b + c,与 target的值的大小。分情况讨论，如果 sum == target，直接返回target；如果sum > target，说明right指针需要左移；如果 sum < c，说明left指针需要继续右移
         4、每次最内层while循环结束后，都比较sum-target与closestNum-target的绝对值
         5、循环结束，返回结果
         **/
        // 先按从大到小排序
        let nums = [-1,2,1,-4]
        let target = 1
        
        if nums.count <= 3 {
            return nums.reduce(0, +)
        }
        let newNums = nums.sorted()
        let count = newNums.count - 1
        var closestNum = 0
        
        for (i, num) in newNums.enumerated() {
            if i > 0 && newNums[i] == newNums[i - 1] {
                continue
            }
            
            var left = i + 1
            var right = count
            
            if i == 0 {
                // 初始化closestNum
                closestNum = newNums[left] + newNums[right] + num
            }
            
            while left < right {
                let sum = newNums[left] + newNums[right] + num
                
                if sum == target {
                    // 如果值相等则直接放回target的值
                    return target
                }
                
                if abs(sum - target) < abs(closestNum - target) {
                    closestNum = sum
                }
                    
                if sum > target {
                    // a + b + c > target
                    // 如果sum大于目标值，说明sum要缩小，则right左移
                    right -= 1
                } else {
                    // a + b + c < target
                    // 如果sum小于目标值，说明sum要增大，则left右移
                    left += 1
                }
            }
        }
        
        return closestNum
    }
}
