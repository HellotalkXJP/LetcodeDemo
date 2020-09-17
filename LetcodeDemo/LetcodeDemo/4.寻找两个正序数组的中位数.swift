//
//  4、寻找两个正序数组的中位数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/9.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Solution4: NSObject {
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
