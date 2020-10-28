//
//  42. 接雨水.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/23.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution42 {
    func trap(_ height: [Int]) -> Int {
        /*
         42. 接雨水
         给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
         示例 1：
         输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
         输出：6
         解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

         示例 2：
         输入：height = [4,2,0,3,2,5]
         输出：9
         
         解题思路：
         每次计算当前列能存多少雨水
         找到当前列，左边的最大墙的高度leftMax以及右边最大墙的高度rightMax
         取左右两边墙的较小值min(leftMax, rightMax)跟当前墙高度比较。
         可以分以下三种情况讨论：
         1、较小的墙高度大于当前列的墙的高度，此时当前列，存水量为，min(leftMax, rightMax) - height[i]
         2、较小的墙高度小于当前列的墙的高度，此时当前列，存水量为0
         3、较小的墙的高度等于当前列的墙的高度，此时当前列，存水量为0，此情形结果跟情形2一致，可以一起处理
         4、把每列能存的雨水加起来，就是所得到的结果
         **/
        var sum = 0
        for (i, value) in height.enumerated() {
            // 找出左边最大墙的高度
            var leftMax = 0
            for left in 0..<i {
                leftMax = max(leftMax, height[left])
            }
            
            // 找出右边最大墙的高度
            var rightMax = 0
            for right in i+1..<height.count {
                rightMax = max(rightMax, height[right])
            }
            
            let minValue = min(leftMax, rightMax)
            if minValue > value {
                sum += minValue - value
            }
        }
        
        return sum
    }
}
