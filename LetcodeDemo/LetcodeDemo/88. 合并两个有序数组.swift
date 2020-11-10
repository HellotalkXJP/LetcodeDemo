//
//  88. 合并两个有序数组.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/9.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        /*
         88. 合并两个有序数组
         给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
         说明：
         初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
         你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
         示例：
         输入：
         nums1 = [1,2,3,0,0,0], m = 3
         nums2 = [2,5,6],       n = 3
         输出：[1,2,2,3,5,6]

         解题思路：
         方法一：直接把数组加到后面，然后在重新排序数组，简单粗暴，就不给出代码了
         方法二：双指针，从后往前遍历
         1  2   3   0   0   0
                p1          p
         2  5   6
                p2
         1、p1 = 2, p = 5, p2 = 2
         2、nums1[p1] < nums2[p2] ==> nums1[p] = nums2[p2] ==> nums1[5] = 6  => nums1 = [1, 2, 3, 0, 0, 6], p1 = 2, p2 - 1 = 1, p - 1 = 4
         3、nums1[p1] < nums2[p2] ==> nums1[p] = nums2[p2] ==> nums1[4] = 5 ==> nums1 = [1, 2, 3, 0, 5, 6], p1 = 2, p2 - 1 = 0, p - 1 = 3
         4、nums1[p1] > nums2[p2] ==> nums1[p] = nums1[p1] ==> nums1[3] = 3 ==> nums1 = [1, 2, 3, 3, 5, 6], p1 - 1 = 1, p2 = 0, p - 1 = 2
         5、nums1[p1] = nums2[p2] ==> nums1[p] = nums1[p2] ==> nums1[2] = 2 ==> nums1 = [1, 2, 2, 3, 5, 6], p1 = 1, p2 - 1 = -1, p - 1 = 1
         6、p2 = -1 < 0，return
         **/
        var p = m + n - 1, p1 = m - 1, p2 = n - 1
        while p2 >= 0 && p >= 0 {
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
    }
}
