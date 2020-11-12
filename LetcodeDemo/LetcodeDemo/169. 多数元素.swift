//
//  169. 多数元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        /*
         169. 多数元素
         给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
         你可以假设数组是非空的，并且给定的数组总是存在多数元素。

         示例 1:
         输入: [3,2,3]
         输出: 3
         
         示例 2:
         输入: [2,2,1,1,1,2,2]
         输出: 2

         解题思路：
         方法一：因为题目假设数组非空，并且是存在多数元素。说明，把数组从小到大排序之后，nums[n/2]，一定就是那个多数的元素
         /*
         let nums = nums.sorted()
         return nums[nums.count / 2]
         */
         方法二：投票算法
         使用maj来记录众数，使用变量count来计算投票，众数+1，非众数-1。因为众数个数大于n/2，所以最后count>0
         当count==0时，更新maj，判断num==maj，相等的话说明是众数，count+1，否则count-1
                2   2   1   1   1   2   2
         maj    2   2   2   2   1   1   2
         count  1   2   1   0   1   0   1
         **/
        var maj = 0
        var count = 0
        
        for num in nums {
            if count == 0 {
                maj = num
            }
            
            count += (maj == num) ? 1 : -1
        }
        
        return maj
    }
}
