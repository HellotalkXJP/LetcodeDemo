//
//  41. 缺失的第一个正数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution41 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        /*
         41. 缺失的第一个正数
         给你一个未排序的整数数组，请你找出其中没有出现的最小的正整数。
         示例 1:
         输入: [1,2,0]
         输出: 3
         
         示例 2:
         输入: [3,4,-1,1]
         输出: 2
         
         示例 3:
         输入: [7,8,9,11,12]
         输出: 1

         解题思路：
         1、因为是要找最小正整数，所以先进行第一波遍历，把数组中的小于等于0的值修改为n+1
         i       0    1     2    3
         nums    3    4    -1    1
         ==>     3    4     5    1
         2、因为值是[1..n]，所以在一次重新遍历数组，判断当前值num的绝对值是否小于n,若是，则把数组的下标num-1做标记，比如添加一个符号
            比如：nums数组个数是4， nums[3] = 1 则数组修改为 nums[0] = -1
            i       0    1     2    3
            nums    3    4     5    1
            ==>  nums[0] = 3 <= count ==> nums[3-1] = -|nums[3-1]| ==> 3 4 -5  1
                 nums[1] = 4 <= count ==> nums[4-1] = -|nums[4-1]| ==> 3 4 -5 -1
                 nums[2] = |-5| > count  ==> nums[2] = nums[2]     ==> 3 4 -5 -1
                 nums[3] = |-1| <= count ==> nums[1-1] = -|nums[0]|==> -3 4 -5 -1
            ==>  最终的数组变为 -3 4 -5 -1
         3、在进行最后一波循环，找到第一个大于0的值的index, index + 1即为所求结果
            
         **/
        var nums = nums
        let count = nums.count
        for i in 0..<count {
            if nums[i] <= 0 {
                nums[i] = count + 1
            }
        }
        
        for i in 0..<count {
            let num = abs(nums[i])
            if num <= count {
                nums[num-1] = -abs(nums[num-1])
            }
            
            print("nums = \(nums)")
        }
        
        for i in 0..<count {
            if nums[i] > 0 {
                return i + 1
            }
        }
        
        return count + 1
    }
}
