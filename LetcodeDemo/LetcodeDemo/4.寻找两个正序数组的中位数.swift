//
//  4、寻找两个正序数组的中位数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/9.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Solution4: NSObject {
    /*
     4. 寻找两个正序数组的中位数
     给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的中位数。
     输入：nums1 = [1,3], nums2 = [2]
     输出：2.00000
     解释：合并数组 = [1,2,3] ，中位数 2
     
    解题思路

    1、分别找到第(m+n+1)/2个和(m+n+2)/2个值，相加然后求平均。这样不用去区分m+n数组个数是奇数还是偶数，假设m+n=6，那么(m+n+1)/2 = 3，(m+n+2)/2 = 4，中间值就是(nums[3] + nums[4]) / 2.0,假设m+n=7,(m+n+1)/2 = 4，(m+n+2)/2 = 4，中间值就是(nums[4] + nums[4]) / 2.0，所以找(m+n+1)/2和(m+n+2)/2的值就可以了。
    2、2分法找k值。用2个下标，i为nums1下标，j为nums2下标。比较2个数组第k/2的值，若value1<value2，则nums1的下标i往后移k/2，反之，nums2的下标j往后移k/2，递归调用。
    **/
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let length1 = nums1.count
        let length2 = nums2.count
        let left = (length1 + length2 + 1) / 2
        let right = (length1 + length2 + 2) / 2
        
        return Double(findKth(nums1, 0, nums2, 0, left) + findKth(nums1, 0, nums2, 0, right)) / 2.0
    }
    
    static func findKth(_ nums1: [Int], _ i: Int, _ nums2: [Int], _ j: Int, _ k: Int) -> Int {
        if i >= nums1.count {
            return nums2[j + k - 1]
        }
        
        if j >= nums2.count {
            return nums1[i + k - 1]
        }
        if k == 1 {
            return min(nums1[i], nums2[j])
        }
        
        if i + k / 2 - 1 >= nums1.count {
            return findKth(nums1, i, nums2, j + k / 2, k - k / 2)
        }
        
        if j + k / 2 - 1 >= nums2.count {
            return findKth(nums1, i + k / 2, nums2, j, k - k / 2)
        }
        
        let value1 = nums1[i + k / 2 - 1]
        let value2 = nums2[j + k / 2 - 1]
        
        if value1 < value2 {
            return findKth(nums1, i + k / 2, nums2, j, k - k / 2)
        } else {
            return findKth(nums1, i, nums2, j + k / 2, k - k / 2)
        }
    }
}
