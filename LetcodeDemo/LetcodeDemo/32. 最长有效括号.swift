//
//  32. 最长有效括号.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution32 {
    func longestValidParentheses(_ s: String) -> Int {
        /*
         32. 最长有效括号
         给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
         输入: "(()"
         输出: 2
         解释: 最长有效括号子串为 "()"
         
         思路：用栈的方式 "("入栈，")"开始出栈。
         1、先初始化栈，入栈一个初始值-1
         2、遍历字符串，字符为"("，则将下标值入栈，如果字符串为")"，则开始出栈。
         3、出栈时，判断栈的下标top是否等于-1(栈是否为空)，若为空，则说明栈内已经没有匹配的"("，则把下标值入栈；若不为空，当前下标减去当前栈顶的值，即为当前匹配"()"的长度
         4、比较下最大值
         5、循环结束，得到匹配"()"的最大长度
         
         **/
        if s.count <= 1 {
            return 0
        }
        var maxLength = 0
        var stack = Array(repeating: -1, count: s.count + 1)
        var top = 0
        stack[top] = -1
        
        for (index, char) in s.enumerated() {
            if char == "(" {
                top += 1
                stack[top] = index
            } else {
                top -= 1
                
                if top == -1 {
                    top += 1
                    stack[top] = index
                } else {
                    maxLength = max(maxLength, index - stack[top])
                }
            }
        }
        
        return maxLength
    }
}
