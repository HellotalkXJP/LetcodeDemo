//
//  56. 合并区间.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/4.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        /*
         56. 合并区间
         给出一个区间的集合，请合并所有重叠的区间。
         示例 1:
         输入: intervals = [[1,3],[2,6],[8,10],[15,18]]
         输出: [[1,6],[8,10],[15,18]]
         解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
         
         示例 2:
         输入: intervals = [[1,4],[4,5]]
         输出: [[1,5]]
         解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。

         解题思路：
         1、先给所有的区间，按区间的左端点升序排列
         2、再把第一个区间加到结果中
         3、遍历其他剩余区间。判断比较结果中的最后一个区间的右端点，如果结果中的右端点比当前的左端点值还小，说明没有重复值，直接把该区间加入到结果中； 如果结果中的右端点比当前左端点的值大，说明有重复。重新修改结果。
         4、遍历结束，输入结果
         **/
        var results = [[Int]]()
        if intervals.count == 0 || intervals[0].count == 0 {
            return results
        }
        // 第一步，先给所有的区间，按区间的左端点升序排列
        let newIntervals = intervals.sorted { (a, b) -> Bool in
            a[0] < b[0]
        }
        
        // 先把第一个区间加入到结果中
        results.append(newIntervals[0])
        
        // 遍历其他区间
        for i in 1..<newIntervals.count {
            let left = newIntervals[i][0]
            let right = newIntervals[i][1]
            let resultCount = results.count
            let lastResult = results[resultCount - 1]
            if lastResult[1] < left {
                // 比较结果中的最后一个区间的右端点，如果结果中的右端点比当前的左端点值还小，说明没有重复值，直接把该区间加入到结果中
                results.append([left, right])
            } else {
                // 如果结果中的右端点比当前左端点的值大，说明有重复。重新修改结果。
                let resultLeft = lastResult[0]
                let resultRight = lastResult[1]
                results[resultCount-1] = [resultLeft, max(right, resultRight)]
            }
        }
        
        return results
    }
    
    
}
