//
//  40. 组合总和 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution40 {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        /*
         40. 组合总和 II
         给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
         candidates 中的每个数字在每个组合中只能使用一次。
         说明：
         所有数字（包括目标数）都是正整数。
         解集不能包含重复的组合。
         示例 1:
         输入: candidates = [10,1,2,7,6,1,5], target = 8,
         所求解集为:
         [
           [1, 7],
           [1, 2, 5],
           [2, 6],
           [1, 1, 6]
         ]
         
         示例 2:
         输入: candidates = [2,5,2,1,2], target = 5,
         所求解集为:
         [
           [1,2,2],
           [5]
         ]
         
         解题思路：
         回溯算法，与39题思路一致，区别，这一题要求每个元素只能使用一次，需要做下去重处理
         
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
            
            // 去部分重复
            if i > begin && candidates[i] == candidates[i - 1] {
                continue
            }
            
            var path = path
            path.append(candidates[i])
            // 与上一次不一样，因为元素不可以重复使用，这里递归传递下去的是 i + 1 而不是 i
            dfs(candidates, target - candidates[i], i + 1, path, &result)
            path.removeAll()
        }
    }
}
