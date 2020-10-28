//
//  47. 全排列 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/28.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        /*
         47. 全排列 II
         给定一个可包含重复数字的序列，返回所有不重复的全排列。
         示例:
         输入: [1,1,2]
         输出:
         [
           [1,1,2],
           [1,2,1],
           [2,1,1]
         ]
         解题思路：
         与上一题大致相同，还是使用回溯算法，区别就是此题需要去重。
         因为是有重复的数字，所以需要先排下序
         去重条件是：当遍历到这个数与上一个数相同时，并且上一个数刚刚撤销完（还没有用过这个数），跳过循环
         
         **/
        var result = [[Int]]()
        if nums.count == 0 {
            return result
        }
        
        let path = [Int]()
        let used = [Int: Bool]()
        dfs(nums.sorted(), 0, path, used, &result)
        return result
    }
    
    func dfs(_ nums: [Int], _ depth: Int, _ path: [Int], _ used: [Int: Bool], _ result: inout [[Int]]) {
        if depth == nums.count {
            print("结果 ===》\(path)")
            result.append(path)
            return
        }
        
        var path = path
        var used = used
        for i in 0..<nums.count {
            if used[i] ?? false {
                continue
            }
            
            if i > 0 && nums[i] == nums[i - 1] && !(used[i-1] ?? false) {
                // 起点相同时，当后一个数跟上一个数相同，并且上一数字在前面刚撤销（还没有用过这个数），说明这时会重复
                continue
            }
            
            let num = nums[i]
            
            path.append(num)
            used[i] = true
            print("递归之前 ===》\(path)")
            dfs(nums, depth + 1, path, used, &result)
            
            used[i] = false
            path.remove(at: path.count - 1)
            print("递归之后 ===》\(path)")
        }
    }
}
