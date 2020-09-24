//
//  18. 四数之和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/23.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution18 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        /*
         nums = [1, 0, -1, 0, -2, 2]  target = 0
         ==>
         [
           [-1,  0, 0, 1],
           [-2, -1, 1, 2],
           [-2,  0, 0, 2]
         ]
         根据三数之和的思路，往外在套一层循环
         **/
        // 数组从小到大排序
        let nums = [-1,-5,-5,-3,2,5,0,4]
        

        let target = -7
        if nums.count < 4 {
            return [[Int]]()
        }
        let newNums = nums.sorted()
        let count = newNums.count
        var array = [[Int]]()
        for (i, num) in newNums.enumerated() {
            let start = i + 1
            if i > 0 && newNums[i] == newNums[i - 1] {
                continue
            }
            
            for j in start..<count {
                if j > start && newNums[j] == newNums[j - 1] {
                    continue
                }
                var left = j + 1
                var right = count - 1
                while left < right {
                    let sum = num + newNums[j] + newNums[left] + newNums[right]
                    if sum == target {
                        array.append([num, newNums[j], newNums[left], newNums[right]])
                        // 如果left的值跟后一个值相等，则left继续右移
                        while left < right && newNums[left] == newNums[left+1] {
                            left += 1
                        }
                        
                        // 如果right的值跟前一个值相等，则right继续左移
                        while left < right && newNums[right] == newNums[right-1] {
                            right -= 1
                        }
                        // 如果值跟目标相等，则left右移，right左移
                        left += 1
                        right -= 1
                    } else if sum > target {
                        // 如果sum大于目标值，说明sum要缩小，则right左移
                        right -= 1
                    } else {
                        // 如果sum小于目标值，说明sum要增大，则left右移
                        left += 1
                    }
                }
            }
        }
        
        return array
    }
}
