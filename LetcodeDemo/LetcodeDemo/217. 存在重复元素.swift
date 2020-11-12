//
//  217. 存在重复元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution217 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        /*
         217. 存在重复元素
         给定一个整数数组，判断是否存在重复元素。
         如果任意一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。

         示例 1:
         输入: [1,2,3,1]
         输出: true
         
         示例 2:
         输入: [1,2,3,4]
         输出: false
         示例 3:

         输入: [1,1,1,3,3,4,3,2,4,2]
         输出: true

         解题思路：
         方法一：2层循环线性查找，在LeetCode上会用例会超时
         ```
         for i in 0..<nums.count {
             for j in i+1..<nums.count {
                 if nums[i] == nums[j] {
                     return true
                 }
             }
         }
         
         return false
         ```
         方法二：先数组排序，然后判断前后2个数是否相等。（LeetCode通过）
         ```
         if nums.count == 0 {
             return false
         }
         let newNums = nums.sorted()
         for i in 0..<newNums.count-1 {
             if newNums[i] == newNums[i+1] {
                 return true
             }
         }
         
         return false
        ```
         
         方法三：哈希表存储
         **/
        var dict = [Int: Bool]()
        for item in nums {
            if dict[item] ?? false {
                return true
            }
            
            dict[item] = true
        }
        
        return false
    }
}
