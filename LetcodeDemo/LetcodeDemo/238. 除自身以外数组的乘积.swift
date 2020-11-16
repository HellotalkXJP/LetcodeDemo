//
//  238. 除自身以外数组的乘积.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        /*
         238. 除自身以外数组的乘积
         给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。
         示例:
         输入: [1,2,3,4]
         输出: [24,12,8,6]
          
         提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。
         说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。
         
         解题思路：
                  0      1       2       3
         res[0]   1    num[1]  num[2]  num[3]
         res[1] num[0]   1     num[2]  num[3]
         res[2] num[0] num[1]    1     num[3]
         res[3] num[0] num[1]  num[2]    1
         
         将nums和res结果看成是矩阵的形式。对角线上为1。res的结果就等于下三角的乘积*上三角的乘积
         分别用p、q来存储下三角、上三角的乘积。2次遍历nums数组，正向遍历数组nums可以得到下三角p的值，反向遍历nums可以得到上三角的值。最后用p*q就可以的到当前行的乘积。
         **/
        var result = Array(repeating: 1, count: nums.count)
        var p = 1
        for i in 0..<nums.count {
            result[i] = p
            p *= nums[i]
        }
        
        var q = 1
        for j in stride(from: nums.count-1, through: 0, by: -1) {
            result[j] *= q
            q *= nums[j]
        }
        
        return result
    }
}
