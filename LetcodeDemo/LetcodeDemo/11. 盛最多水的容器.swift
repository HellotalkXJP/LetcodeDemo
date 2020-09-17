//
//  11. 盛最多水的容器.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution11 {
    static func maxArea(_ height: [Int]) -> Int {
        // 双指针
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left != right {
            let minValue = min(height[left], height[right])
            let distance = right - left
            maxArea = max(maxArea, minValue * distance)
            
            // 值小的往前移动
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}
