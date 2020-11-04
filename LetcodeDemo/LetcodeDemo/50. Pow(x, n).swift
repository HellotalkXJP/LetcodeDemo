//
//  50. Pow(x, n).swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/2.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution50 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        /*
         50. Pow(x, n)
         实现 pow(x, n) ，即计算 x 的 n 次幂函数。
         示例 1:
         输入: 2.00000, 10
         输出: 1024.00000
         
         示例 2:
         输入: 2.10000, 3
         输出: 9.26100
         
         解题思路：
         快速幂,2分法。
         例 3^5     res      x        n
         ==> 3^5    1       3        5
         ==> 3^5   1*3=3    3*3=9    5/2=2
         ==> 3^5    3       9*9=81   2/2=1
         ==> 3^5  3*81=243  81*81    1/2=0
         ==> 3^5 = 243
         **/
        var result: Double = 1
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        while n > 0 {
            if n & 1 == 1 {
                // n % 2 == 1，是否为奇数
                result *= x
            }
            
            x *= x
            n = n >> 1 // 右移1位==> n / 2
        }
        
        return result
    }
}
