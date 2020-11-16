//
//  6. Z 字形变换.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution6 {
    /*
     6. Z 字形变换
     将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
     比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
     L   C   I   R
     E T O E S I I G
     E   D   H   N
     之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
     **/
    func convert(_ s: String, _ numRows: Int) -> String {
        /*
        LEETCODEISHIRING
         
         L   C   I   R
         E T O E S I I G
         E   D   H   N
         
         L     D     R
         E   O E   I I
         E C   I H   N
         T     S     G
         
         0   4   8    12
         1 3 5 7 9 11 13 15
         2   6   10   14
         
         0     6       12
         1   5 7    11 13
         2 4   8 10    14
         3     9       15
        找规律
        对余数k判断
        k = i%(2n-2)
        k == 0 ----> row0
        k == 1 & 2n-2-1 ----> row1
        k == 2 & 2n-2-2 ----> row2
        k == n-1 ----> row(n-1)

        如果 k<= n-1, i就是属于第k行
        如果 k>n-1, i就是属于第2n-2-k行
        **/
        if s.count <= 1 || numRows <= 1 {
            return s
        }
        
        // 创建2位数组
        var rows = [[String]]()
        for _ in 0..<numRows {
            let row = [String]()
            rows.append(row)
        }
        
        // 二维数组赋值
        for (i, char) in s.enumerated() {
            let k = i % (2 * numRows - 2)
            if k <= numRows - 1 {
                var row = rows[k]
                row.append(String(char))
                rows[k] = row
            } else {
                var row = rows[2 * numRows - 2 - k]
                row.append(String(char))
                rows[2 * numRows - 2 - k] = row
            }
        }
        
        // 拼接2维数组
        var tempStr = ""
        for index in 0..<numRows {
            let row = rows[index]
            tempStr += row.joined(separator: "")
        }
        
        return tempStr
    }
}
