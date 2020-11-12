//
//  215. 数组中的第K个最大元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        /*
         215. 数组中的第K个最大元素
         在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
         示例 1:
         输入: [3,2,1,5,6,4] 和 k = 2
         输出: 5
         
         示例 2:
         输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
         输出: 4
         说明:
         你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
         
         解题思路：
         // 使用快速排序，数组从小到大排序。然后找到倒数第k个值，也就是nums[n-k]的值
         1、根据快速排序，我们可以知道，数组会被分成2部分，左边部分都比选择的那个数小，右边部分都比选择的那个数大，根据这个，我们可以改写下快速排序。
         数组分成3部分，nums[0...x-1]、nums[x]、nums[x+1...length-1]，找到x的下标值
         2、判断选择的那个数nums[x]的下标x与目标值n-k
         3、如果x刚好等于目标值，则直接返回nums[x]
         4、如果x<目标值，则递归排序右区间；反之x>目标值，则继续递归排序左区间。这样就可以通过只排序一个区间来输出结果，不用去关心另外一个区间的排序情况，提高效率
         例如：快速排序
         index  0   1   2   3   4   5   6   7
         nums   5   3   7   6   4   1   2   0
         每次都从区间第一个元素取选择元素 selectNum = 5
         i=0,j=7, 从j往前找到第一个小于5的值，交换5 0的值 ==> 0  3  7  6  4  1  2  5
         i=0,j=7, 从i往前找到第一个大于5的值，交换7 5的值 ==> 0  3  5  6  4  1  2  7
         i=2,j=7, 从j往前找到第一个小于5的值，交换5 2的值 ==> 0  3  2  6  4  1  5  7
         i=2,j=6, 从i往前找到第一个大于5的值，交换6 5的值 ==> 0  3  2  5  4  1  6  7
         i=3,j=6, 从j往前找到第一个小于5的值，交换5 1的值 ==> 0  3  2  1  4  5  6  7
         i=3,j=6, 从i往前找到第一个大于5的值，交换6 5的值 ==> 没找到退出循环 ==> i=j=5
         ...
         index=5 之前的数字都是小于选择的元素5的区间
         index=5 之后的数字都是大于选择的元素5的区间
         
         **/
        return quickSelect(nums, 0, nums.count - 1, nums.count - k)
    }
    
    func quickSelect(_ nums: [Int], _ left: Int, _ right: Int, _ targetIndex: Int) -> Int {
        var nums = nums
        let x = partition(&nums, left, right)
        
        if x == targetIndex {
            return nums[x]
        }
        
        return x > targetIndex ? quickSelect(nums, left, x - 1, targetIndex) : quickSelect(nums, x + 1, right, targetIndex)
    }
    
    // 快速排序后找到选择的那个数的index
    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let selectNum = nums[left]
        var i = left, j = right
        
        while i < j {
            while i < j && selectNum <= nums[j] {
                j -= 1
            }
            // 从j往前找，找到第一个比selectNum小的值，交换2个值
            swap(&nums, i, j)
            
            // 从i往后找，找到第一个比selectNum
            while i < j && nums[i] <= selectNum {
                i += 1
            }
            swap(&nums, i, j)
        }
        
        return i
    }
    
    func swap<T>(_ nums: inout [T], _ a: Int, _ b: Int) {
        (nums[a], nums[b]) = (nums[b], nums[a])
    }
}
