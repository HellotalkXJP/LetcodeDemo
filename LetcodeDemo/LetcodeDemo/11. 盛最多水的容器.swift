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
        /*
         11. 盛最多水的容器
         给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

         说明：你不能倾斜容器，且 n 的值至少为 2。

         输入：[1,8,6,2,5,4,8,3,7]
         输出：49
         
         解题思路：
         所求面积=距离*最小值，所以使用2个指针(left、right)
         比较left、right指针的值，值小的就往前移动。直到left==right，循环结束
         **/
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
