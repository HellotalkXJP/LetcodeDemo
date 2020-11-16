//
//  231. 2的幂.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        /*
         231. 2的幂
         给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
         示例 1:
         输入: 1
         输出: true
         解释: 2^0 = 1
         
         示例 2:
         输入: 16
         输出: true
         解释: 2^4 = 16
         
         示例 3:
         输入: 218
         输出: false

         解题思路：
         假设 n = 2^x 为2的x次幂：
         1、那么n的二进位只有最高为1，其他位都为0，并且n-1的最高位为0，其他位为1
         可以推断出，若n为2的幂，那么 n & (n-1) == 0 成立
         例如：
         1  2^0   0001 & 0000 = 0
         2  2^1   0010 & 0001 = 0
         4  2^2   0100 & 0011 = 0
         8  2^3   1000 & 0111 = 0
         ...
         **/
        return n > 0 && n & (n-1) == 0
    }
}
