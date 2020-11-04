//
//  54. 螺旋矩阵.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/4.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        /*
         54. 螺旋矩阵
         给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
         示例 1:
         输入:
         [
          [ 1, 2, 3 ],
          [ 4, 5, 6 ],
          [ 7, 8, 9 ]
         ]
         输出: [1,2,3,6,9,8,7,4,5]
         
         示例 2:
         输入:
         [
           [1, 2, 3, 4],
           [5, 6, 7, 8],
           [9,10,11,12]
         ]
         输出: [1,2,3,4,8,12,11,10,9,5,6,7]
         
         解题思路：
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
        var result = [Int]()
        if matrix.count == 0 || matrix[0].count == 0 {
            return result
        }
        
        let rows = matrix.count
        let columns = matrix[0].count
        var left = 0, right = columns - 1, top = 0, bottom = rows - 1
        
        // 把二维数组分成n层。从外层到里层一次遍历
        while left <= right && top <= bottom {
            // 第一步：top: 从左到右遍历 left -> right
            for column in left...right {
                result.append(matrix[top][column])
            }
            
            // 第二步：right: 从上到下遍历 top+1 -> bottom
            if top < bottom {
                for row in top+1...bottom {
                    result.append(matrix[row][right])
                }
            }
            
            if left < right && top < bottom {
                // 第三步：bottom：从右到左遍历 right-1 -> left+1
                for column in stride(from: right-1, through: left+1, by: -1) {
                    result.append(matrix[bottom][column])
                }
                
                // 第四步：left：从下到上遍历 bottom -> top+1
                for row in stride(from: bottom, through: top+1, by: -1) {
                    result.append(matrix[row][left])
                }
            }
            
            // 一层循环结束后，开始下一层循环
            left += 1
            right -= 1
            bottom -= 1
            top += 1
        }
        
        return result
    }
}
