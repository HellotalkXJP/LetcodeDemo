//
//  45. 跳跃游戏 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/28.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution45 {
    func jump(_ nums: [Int]) -> Int {
        /*
         45. 跳跃游戏 II
         给定一个非负整数数组，你最初位于数组的第一个位置。
         数组中的每个元素代表你在该位置可以跳跃的最大长度。
         你的目标是使用最少的跳跃次数到达数组的最后一个位置。
         示例:
         输入: [2,3,1,1,4]
         输出: 2
         解释: 跳到最后一个位置的最小跳跃数是 2。
              从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。

         解题思路:
         
         
         **/
//        let nums = [2, 3, 1, 1, 4, 2, 1]
        let nums = [2, 3, 1, 1, 4]
        var steps = 0
        var end = 0
        var maxPostion = 0
        
        for index in 0..<nums.count - 1 {
            maxPostion = max(maxPostion, index + nums[index])
            if index == end {
                end = maxPostion
                steps += 1
            }
            
        }
        
        return steps
    }
}
