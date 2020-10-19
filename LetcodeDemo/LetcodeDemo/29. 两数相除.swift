//
//  29. 两数相除.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution29 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        /*
         29. 两数相除
         给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
         返回被除数 dividend 除以除数 divisor 得到的商。
         整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
         示例 1:
         输入: dividend = 10, divisor = 3
         输出: 3
         解释: 10/3 = truncate(3.33333..) = truncate(3) = 3

         解题思路:
         1、除数一直双倍的加，直到最接近被除数并且小于被除数为止。
         2、然后在把被除数减去之前得到的最接近的值，在继续上一步的操作。计算总共加了多少次，就是最后结果。
         举个例子：
         60/8
         8+8=16(记录加了2次)==>16+16=32(加了4次)=>32+32=64>60退出循环，这次循环加了4次，接近60的值是32
         剩余的数为60-32=28继续上步操作 8+8=16(记录加了2次)=>16+16=32>28退出循环，这次循环加了2次，接近28的值为16
         剩余的数为28-16=12继续上步操作 8(记录加了1次) =>8+8=16>12退出循环，这次循环加了1次，接近12的值为8
         剩余的数为12-8 继续上步操作，被除数小于除数，返回0。
         所以，总共加了4+2+1=7
         60/8=7
         3、接着就是临界值判断。分三种，被除数为0时，直接返回0；除数为1时，直接返回本身值；除数为-1时，如果被除数比边界值最小值还小，除以-1之后，就会比边界值还大，所以此时返回最大边界值，其他情况，返回相反数
         **/
        if dividend == 0 {
            return 0
        }
        
        if divisor == 1 {
            return dividend
        }
        
        if divisor == -1 {
            // 如果被除数比边界值最小值还小，除以-1之后，就会比边界值还大，所以此时返回最大边界值，其他情况，返回相反数
            if dividend > Int(Int32.min) {
                return -dividend
            }
            return Int(Int32.max)
        }
        // 结果是正数还是负数标志
        let sign = dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
        let a = dividend > 0 ? dividend : -dividend
        let b = divisor > 0 ? divisor : -divisor
        let res = div(a, b)
        
        return sign ? res : -res
    }
    
    func div(_ a: Int, _ b: Int) -> Int {
        if a < b {
            return 0
        }
        
        var count = 1
        var result = b
        while result + result <= a {
            // 结果成倍的加
            count += count
            // 测试的值也是成倍的加，知道值大于目标值，退出循环
            result += result
        }
        
        return count + div(a-result, b)
    }
}
