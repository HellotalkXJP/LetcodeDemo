//
//  57. 插入区间.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/5.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution57 {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        /*
         57. 插入区间
         给出一个无重叠的 ，按照区间起始端点排序的区间列表。
         在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
         示例 1：
         输入：intervals = [[1,3],[6,9]], newInterval = [2,5]
         输出：[[1,5],[6,9]]
         
         示例 2：
         输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
         输出：[[1,2],[3,10],[12,16]]
         解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。

         解题思路：
         1、逐个区间遍历 [Li, Ri]与新插入的区间[left, right]比较
         2、如果Li>right ==> 该区间与新区间没有重叠，并且该区间在新区间的右边边，此时可以直接把该区间加到结果中
         3、如果Ri<left ==> 该区间与新区间没有重叠，并且该区间在新区间的左边。此时可以把该区间加到结果中
         4、如果不是上面2种情况，说明新区间有重叠，设置标志位overlap。记录此时的Li，以及max(Ri，right)，继续遍历，直到找到第一个Li>right的值，此时把区间[Li, max(Ri, right)]，加入到结果中
         5、遍历结束，最后判断overlap，没有重叠区间，则把新区间直接加到结果中
         6、输出结果
         **/
        
        var results = [[Int]]()
        var left = newInterval[0], right = newInterval[1]
        var overlap = false
        
        for interval in intervals {
            if interval[0] > right {
                // 情形一
                if !overlap {
                    results.append([left, right])
                    overlap = true
                }
                
                results.append(interval)
            } else if interval[1] < left {
                // 情形二
                results.append(interval)
            } else {
                // 情形三：有重叠区间
                left = min(interval[0], left)
                right = max(interval[1], right)
            }
        }
        
        // 如果遍历完overlap仍为false，说明没有重叠区间，把新区间直接加到结果中
        if !overlap {
            results.append([left, right])
        }
        
        return results
    }
}
