//
//  36. 有效的数独.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution36 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        /*
         36. 有效的数独
         判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
         数字 1-9 在每一行只能出现一次。
         数字 1-9 在每一列只能出现一次。
         数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
         示例 1:
         输入:
         [
           ["5","3",".",".","7",".",".",".","."],
           ["6",".",".","1","9","5",".",".","."],
           [".","9","8",".",".",".",".","6","."],
           ["8",".",".",".","6",".",".",".","3"],
           ["4",".",".","8",".","3",".",".","1"],
           ["7",".",".",".","2",".",".",".","6"],
           [".","6",".",".",".",".","2","8","."],
           [".",".",".","4","1","9",".",".","5"],
           [".",".",".",".","8",".",".","7","9"]
         ]
         输出: true
         
         示例 2:
         输入:
         [
           ["8","3",".",".","7",".",".",".","."],
           ["6",".",".","1","9","5",".",".","."],
           [".","9","8",".",".",".",".","6","."],
           ["8",".",".",".","6",".",".",".","3"],
           ["4",".",".","8",".","3",".",".","1"],
           ["7",".",".",".","2",".",".",".","6"],
           [".","6",".",".",".",".","2","8","."],
           [".",".",".","4","1","9",".",".","5"],
           [".",".",".",".","8",".",".","7","9"]
         ]
         输出: false
         解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
              但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
         
         解题思路：
         1、采用3个哈希表，行、列、3X3单元格
         2、分别判断3个哈希表里是否有该数字，有则返回false；没有则加入到哈希表中
         **/
        var rowLists = [[Character: Int]]()
        var columnLists = [[Character: Int]]()
        var tableLists = [[Character: Int]]()
        
        // 初始化3个哈希表
        for _ in 0..<board.count {
            let dict = [Character: Int]()
            rowLists.append(dict)
            columnLists.append(dict)
            tableLists.append(dict)
        }
        
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                // 判断3个哈希表里面是否有该数字，有的话，直接返回false，没有的话，则加入到3个哈希表里
                var rowList = rowLists[row]
                var columnList = columnLists[column]
                let tableIndex = (row / 3) * 3 + column / 3
                var tableList = tableLists[tableIndex]
                
                let num = board[row][column]
                if num != "." {
                    if rowList[num] ?? 0 > 0 || columnList[num] ?? 0 > 0 || tableList[num] ?? 0 > 0 {
                        return false
                    }
                    rowList[num] = 1
                    columnList[num] = 1
                    tableList[num] = 1
                    
                    rowLists[row] = rowList
                    columnLists[column] = columnList
                    tableLists[tableIndex] = tableList
                }
            }
        }
        
        return true
    }
}
