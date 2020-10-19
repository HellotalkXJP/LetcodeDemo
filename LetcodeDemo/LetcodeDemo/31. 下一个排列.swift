//
//  31. 下一个排列.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/15.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
        /*
         31. 下一个排列
         实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

         如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

         必须原地修改，只允许使用额外常数空间。

         以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
         1,2,3 → 1,3,2
         3,2,1 → 1,2,3
         1,1,5 → 1,5,1

         解题思路：要明白题目意思，本题要求获取下一个排列比当前排列大的一个排列，就是找最接近这个值并且比这个值大的
         比如 1234==>1243   64753==>65347
         已64753为例子
         首先从后往前遍历，
         找到第一个相邻的2个数，满足 a[i] < a[j]
         6   4   7   5   3
             i   j       end
         此时j后面的顺序肯定是降序的。接着在从j后面的数字中，从后往前找，找到第一个大于a[i]的数a[k]，即a[k] = 5
         然后在置换 a[i]、a[k]
         此时排列为
         6   5   7   4   3
             i   j   k   end
         最后将j后面的顺序置换为升序，即 6 5 3 4 7，此结果就是64753的下一个排列
        **/
        nums = [5,4,7,5,3,2]
        let count = nums.count
        if count <= 1 {
            return
        }
                
        var i = count - 2, j = count - 1
        for index in stride(from: count - 2, through:0, by: -1) {
            if nums[index] < nums[index+1] {
                // 找到相邻的2个数，满足 a[i] < a[j]
                i = index
                j = index + 1
                break
            }
            i -= 1
        }
        
        if i >= 0 {
            // 接着在从j后面的数字中，从后往前找，找到第一个大于a[i]的数a[k]
            for k in stride(from: count - 1, through: j, by: -1) {
                if nums[i] < nums[k] {
                    // 找到a[k]，置换a[k]、a[i]
                    exchangeValue(&nums, i, k)
                    break
                }
            }
            
            // 最后将j后面的序列按升序排列
            var end = count - 1
            for start in j...count-1 {
                if start < end {
                    exchangeValue(&nums, start, end)
                }
                end -= 1
            }
        } else {
            // 没有找到说明是没有找到符合条件的，直接逆转数组
            nums = nums.reversed()
            return
        }
    }
    
    // 交换2个数
    func exchangeValue<T>(_ nums: inout [T], _ a: Int, _ b: Int) {
        (nums[a], nums[b]) = (nums[b], nums[a])
    }
}
