//
//  52. N皇后 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/4.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution52 {
    func totalNQueens(_ n: Int) -> Int {
        /*
         52. N皇后 II
         n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
         给定一个整数 n，返回 n 皇后不同的解决方案的数量。
         示例:
         输入: 4
         输出: 2
         解释: 4 皇后问题存在如下两个不同的解法。
         [
          [".Q..",  // 解法 1
           "...Q",
           "Q...",
           "..Q."],

          ["..Q.",  // 解法 2
           "Q...",
           "...Q",
           ".Q.."]
         ]
         
         解题思路：
         与51题.N 皇后解题思路一致
         **/
        let chess = Array(repeating: Array(repeating: ".", count: n), count: n)
        var result = 0
        solve(&result, chess, 0)
        return result
    }
    
    func solve(_ count: inout Int, _ chess: [[String]], _ row: Int) {
        // 终止条件：当最后一行走完，说明找到了一组，加入到结果中
        if row == chess.count {
            // 先把chess二维数组转成一维数组
            count += 1
            return
        }
        
        for col in 0..<chess.count {
            if valid(chess, row, col) {
                var chess = chess
                chess[row][col] = "Q"
                // 递归下一行
                solve(&count, chess, row + 1)
                chess[row][col] = "."
            }
        }
    }
    
    // 判断当前位置是否可以放皇后
    func valid(_ currentChess: [[String]], _ row: Int, _ column: Int) -> Bool {
        // 第一步：判断当前列，有没有皇后
        for i in 0..<currentChess.count {
            if currentChess[i][column] == "Q" {
                return false
            }
        }
        
        // 第二步：判断当前位置的左上角有没有皇后
        var j = column - 1
        for i in stride(from: row-1, through: 0, by: -1) {
            if j >= 0 {
                if currentChess[i][j] == "Q" {
                    return false
                }
                j -= 1
            }
        }
        
        // 第三步：判断当前位置的右上角有没有皇后
        j = column + 1
        for i in stride(from: row-1, through: 0, by: -1) {
            if j < currentChess.count {
                if currentChess[i][j] == "Q" {
                    return false
                }
                j += 1
            }
        }
        
        return true
    }
}
