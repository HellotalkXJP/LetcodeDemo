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
         双指针 p,q
         思路如下：
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
