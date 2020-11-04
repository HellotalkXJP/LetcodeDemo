//
//  51. N 皇后.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/2.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution51 {
    func solveNQueens(_ n: Int) -> [[String]] {
        /*
         51. N 皇后
         n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击
         给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。
         每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
         示例：
         输入：4
         输出：[
          [".Q..",  // 解法 1
           "...Q",
           "Q...",
           "..Q."],

          ["..Q.",  // 解法 2
           "Q...",
           "...Q",
           ".Q.."]
         ]
         
         
         ["..Q.",
          ".Q..",
          "...Q",
          "Q..."]
         解释: 4 皇后问题存在两个不同的解法。

         解题思路：
         （回溯算法）
         遍历每一行，一个一个的放置Q去尝试，判断是否可行，在回退。
         递归的终止条件就是，遍历到最后一行。把数据加到结果中
         中间判断当前位置是否可以放置Q，须做3步判断，第一步：判断当前位置的这一列有没有Q，有的话，说明当前位置不能放Q；第二步判断当前位置的左上角能不能放Q；第3步则判断当前位置右上角能不能放Q。3步判断完可以放Q，则在当前位置放Q。修改当前chess数组。
         继续下一行尝试，直至递归结束，输出结果。
         
         **/
        let chess = Array(repeating: Array(repeating: ".", count: n), count: n)
        var results = [[String]]()
        solve(&results, chess, 0)
        return results
    }
    
    func solve(_ res: inout [[String]], _ chess: [[String]], _ row: Int) {
        // 终止条件：当最后一行走完，说明找到了一组，加入到结果中
        if row == chess.count {
            // 先把chess二维数组转成一维数组
            res.append(convert(chess))
            return
        }
        
        for col in 0..<chess.count {
            if valid(chess, row, col) {
                var chess = chess
                chess[row][col] = "Q"
                // 递归下一行
                solve(&res, chess, row + 1)
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
    
    // 把二维数组转成一维数组
    func convert(_ chess: [[String]]) -> [String] {
        var temp = [String]()
        for i in 0..<chess.count {
            var s = ""
            for j in 0..<chess[i].count {
                s += chess[i][j]
            }
            temp.append(s)
        }
        return temp
    }
}
