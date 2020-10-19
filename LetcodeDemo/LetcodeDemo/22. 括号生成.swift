//
//  22. 括号生成.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/25.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        /*
         22. 括号生成
         数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
         输入：n = 3
         输出：[
                "((()))",
                "(()())",
                "(())()",
                "()(())",
                "()()()"
              ]
         n = 3
         ==>
         ["((()))",
         "(()())",
         "(())()",
         "()(())",
         "()()()"]
         **/
        var result = [String]()
        if n <= 0 {
            return result
        }

        backtrack("", n, n, &result)
        return result
    }
    
    func backtrack(_ s: String, _ left: Int, _ right: Int, _ result: inout [String]) {
        // 左括号剩余可用数为0且右括号剩余可用数为0时，把结果添加到数组中
        if left == 0 && right == 0 {
            result.append(s)
            return
        }
        
        if left > right {
            return
        }
        
        // 必须左边括号剩余个数大于0，才可以继续添加左括号
        if left > 0 {
            backtrack(s + "(", left - 1, right, &result)
        }
        
        // 必须右边括号剩余个数大于0，才可以继续添加右括号
        if right > 0 {
            backtrack(s + ")", left, right - 1, &result)
        }
    }
}
