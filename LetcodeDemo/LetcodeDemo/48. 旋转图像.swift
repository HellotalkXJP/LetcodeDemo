//
//  48. 旋转图像.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/2.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        /*
         48. 旋转图像
         给定一个 n × n 的二维矩阵表示一个图像。
         将图像顺时针旋转 90 度。
         说明：
         你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
         示例 1:
         给定 matrix =
         [
           [1,2,3],
           [4,5,6],
           [7,8,9]
         ],

         原地旋转输入矩阵，使其变为:
         [
           [7,4,1],
           [8,5,2],
           [9,6,3]
         ]

         解题思路：
         1、先沿右上角最小角中间线转置
         2、在沿中间线上下翻转
         例：
         1   2  ===>先转置   4   2  ===>在上下翻转  3   1
         3   4              3   1                4   2
         **/
        let length = matrix.count
        // 先转置
        for i in 0..<length {
            for j in 0..<length-i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[length-1-j][length-1-i]
                matrix[length-1-j][length-1-i] = temp
            }
            
        }
        // 在翻转
        for i in 0..<length/2 {
            for j in 0..<length {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[length-1-i][j]
                matrix[length-1-i][j] = temp
            }
        }
    }
}
