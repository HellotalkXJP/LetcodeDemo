//
//  62. 不同路径.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/6.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        /*
         62. 不同路径
         一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
         机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
         问总共有多少条不同的路径？

         示例 1:
         输入: m = 3, n = 2
         输出: 3
         解释:
         从左上角开始，总共有 3 条路径可以到达右下角。
         1. 向右 -> 向右 -> 向下
         2. 向右 -> 向下 -> 向右
         3. 向下 -> 向右 -> 向右
         
         示例 2:
         输入: m = 7, n = 3
         输出: 28

         解题思路：
         动态规划
         1、n X m 矩阵，到达dp[i][j]的最长路径为 dp[i-1][j] + dp[i][j-1]
         2、到达第一行或者第一列的步数只能为1 ==> dp[0][j]=1 dp[i][0]=1
         3、遍历，得到dp[n-1][m-1]的值
         **/
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            dp[i][0] = 1
        }
        
        for j in 0..<m {
            dp[0][j] = 1
        }
        
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        return dp[n-1][m-1]
    }
}
