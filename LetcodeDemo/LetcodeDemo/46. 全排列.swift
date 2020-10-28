//
//  46. 全排列.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/28.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        /*
         46. 全排列
         给定一个 没有重复 数字的序列，返回其所有可能的全排列。
         示例:
         输入: [1,2,3]
         输出:
         [
           [1,2,3],
           [1,3,2],
           [2,1,3],
           [2,3,1],
           [3,1,2],
           [3,2,1]
         ]
         
         解题思路：
         回溯算法
         **/
        
        var result = [[Int]]()
        if nums.count == 0 {
            return result
        }
        
        let path = [Int]()
        let used = [Int: Bool]()
        dfs(nums, 0, path, used, &result)
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
            let num = nums[i]
            if !(used[i] ?? false) {
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
}
