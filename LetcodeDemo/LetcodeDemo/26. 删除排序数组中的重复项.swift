//
//  26. 删除排序数组中的重复项.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        /*
         26. 删除排序数组中的重复项
         给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
         不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
         示例：
         给定数组 nums = [1,1,2],
         函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
         你不需要考虑数组中超出新长度后面的元素。

         双指针 p,q
         解题思路：
         1、如果p上的元素跟q上的元素不相等，则将q位置元素复制到q+1位置上。p后移以为，q后移1位
         2、如果q上的元素跟q上的元素相等，则q往后移一位
         3、重复上述过程，直至q等于数组长度
         4、p+1 就是新数组长度
         
         以这个数组为例nums = [0,0,2,2,3,3,4]
         0    0    2    2    3    3    4
         p    q
         
         nums[p] = nums[q]  ==> q = q + 1
         此时 nums[q] = 2
         nums[p] != nums[q] ==> nums[p+1] = nums[q]; p = p + 1; q = q + 1
         此时nums如下
         0    2    2    2    3    3    4
              p         q
         
         nums[p] = nums[q]  ==> q = q + 1
         此时 nums[q] = 3
         nums[p] != nums[q] ==> nums[p+1] = nums[q]; p = p + 1; q = q + 1
         此时nums如下
         0    2    3    2    3    3    4
                   p              q
         
         nums[p] = nums[q]  ==> q = q + 1
         此时 nums[q] = 4
         nums[p] != nums[q] ==> nums[p+1] = nums[q]; p = p + 1; q = q + 1
         此时nums如下
         0    2    3    4    3    3    4
                        p
         
         q=7 < nums.length 条件不满足，退出循环
         p + 1就是新数组的长度了
         **/
        if nums.count == 0 {
            return 0
        }
        var p = 0
        var q = 1
        let length = nums.count
        
        while q < length {
            if nums[p] != nums[q] {
                // 如果q = p + 1且2个元素不相等，可以不用进行赋值操作
                if q - p > 1 {
                    nums[p+1] = nums[q]
                }
                
                p += 1
            }

            q += 1
        }
        
        return p + 1
    }
}
