//
//  70. 爬楼梯.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/6.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        /*
         70. 爬楼梯
         假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
         每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
         注意：给定 n 是一个正整数。
         
         示例 1：
         输入： 2
         输出： 2
         解释： 有两种方法可以爬到楼顶。
         1.  1 阶 + 1 阶
         2.  2 阶
         
         示例 2：
         输入： 3
         输出： 3
         解释： 有三种方法可以爬到楼顶。
         1.  1 阶 + 1 阶 + 1 阶
         2.  1 阶 + 2 阶
         3.  2 阶 + 1 阶

         解题思路：
         动态规划
         1 ==> 1
         2 ==> 2
         3 ==> 3
         4 ==> 5
         ==> 由上数据可以找到规律 f(n) = f(n-2) + f(n-1) n > 2
         ==>斐波拉契数列
         **/
        var first = 1
        var second = 2
        if n == 1 {
            return first
        }
        
        if n == 2 {
            return second
        }
        
        for _ in 3...n {
            let result = first + second
            first = second
            second = result
        }
        
        return second
    }
}
