//
//  39. 组合总和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        /*
         39. 组合总和
         给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
         candidates 中的数字可以无限制重复被选取。
         说明：
         所有数字（包括 target）都是正整数。
         解集不能包含重复的组合。
         示例 1：
         输入：candidates = [2,3,6,7], target = 7,
         所求解集为：
         [
           [7],
           [2,2,3]
         ]
         
         示例 2：
         输入：candidates = [2,3,5], target = 8,
         所求解集为：
         [
           [2,2,2,2],
           [2,3,3],
           [3,5]
         ]
         
         解题思路：
         递归思路
         具体看图解
         **/
        var result = [[Int]]()
        if candidates.count == 0 {
            return result
        }
        
        let path = [Int]()
        // 先排序原数组
        let newCandidates = candidates.sorted()
        dfs(newCandidates, target, 0, path, &result)
        
        return result
    }
    
    func dfs(_ candidates: [Int], _ target: Int, _ begin: Int, _ path: [Int], _ result: inout [[Int]]) {
        if target == 0 {
            result.append(path)
            return
        }
        
        for i in begin..<candidates.count {
            if target - candidates[i] < 0 {
                break
            }
            var path = path
            path.append(candidates[i])
            // 由于每一个元素可以重复使用，下一轮搜索的起点依然是 i
            dfs(candidates, target - candidates[i], i, path, &result)
            path.removeAll()
        }
    }
}
