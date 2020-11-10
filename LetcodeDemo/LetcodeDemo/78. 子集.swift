//
//  78. 子集.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/6.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        /*
         78. 子集
         给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
         说明：解集不能包含重复的子集。
         
         示例:
         输入: nums = [1,2,3]
         输出:
         [
           [3],
           [1],
           [2],
           [1,2,3],
           [1,3],
           [2,3],
           [1,2],
           []
         ]

         解题思路：
         递归
         **/
        var result = [[Int]]()
        let temp = [Int]()
        dfs(0, nums, temp ,&result)
        return result
    }
    
    func dfs(_ index: Int, _ nums: [Int], _ temp: [Int] , _ result: inout [[Int]]) {
        if index == nums.count {
            result.append(temp)
            return
        }
        
        var temp = temp
        temp.append(nums[index])
        dfs(index+1, nums, temp, &result)
        temp.removeLast()
        dfs(index+1, nums, temp, &result)
    }
}
