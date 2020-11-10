//
//  59. 螺旋矩阵 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/5.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        /*
         59. 螺旋矩阵 II
         给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
         示例:
         输入: 3
         输出:
         [
          [ 1, 2, 3 ],
          [ 8, 9, 4 ],
          [ 7, 6, 5 ]
         ]

         解题思路：
         与54. 螺旋矩阵思路一致。
         top,left     -->   top,right
            ^                   |
            |                   v
         bottom,left  <--   bottom,right
         把整个矩阵，从外到内分成n层。从外层到内层一次遍历
         第一步：top: 从左到右遍历 left -> right
         第二步：right: 从上到下遍历 top+1 -> bottom
         第三步：bottom：从右到左遍历 right-1 -> left+1
         第四步：left：从下到上遍历 bottom -> top+1
         **/
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        var top = 0, left = 0, bottom = n - 1, right = n - 1
        var number = 0
        
        while left <= right && top <= bottom {
            // 第一步：top: 从左到右遍历 left -> right
            for column in left...right {
                number += 1
                result[top][column] = number
            }
            
            // 第二步：right: 从上到下遍历 top+1 -> bottom
            if top < bottom {
                for row in top+1...bottom {
                    number += 1
                    result[row][right] = number
                }
            }
            
            if left < right && top < bottom {
                // 第三步：bottom：从右到左遍历 right-1 -> left+1
                for column in stride(from: right-1, through: left+1, by: -1) {
                    number += 1
                    result[bottom][column] = number
                }
                
                // 第四步：left：从下到上遍历 bottom -> top+1
                for row in stride(from: bottom, through: top+1, by: -1) {
                    number += 1
                    result[row][left] = number
                }
            }
            
            top += 1
            left += 1
            bottom -= 1
            right -= 1
        }
        
        return result
    }
}
