//
//  53. 最大子序和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/4.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        /*
         53. 最大子序和
         给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
         示例:
         输入: [-2,1,-3,4,-1,2,1,-5,4]
         输出: 6
         解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

         解题思路：
         1、遍历数组
         2、如果sum>0，说明数据是在增加，则继续加上当前的数字，如果sum<=0，则说明数据在减少，则需sum重新赋值为当前数，每次遍历完之后，都要取最大的sum
         3、直至遍历结束，取出最大的值
         **/
        var result = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            
            result = max(result, sum)
        }
        
        return result
    }
}
