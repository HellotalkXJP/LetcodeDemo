//
//  89. 格雷编码.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/9.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution89 {
    func grayCode(_ n: Int) -> [Int] {
        /*
         89. 格雷编码
         格雷编码是一个二进制数字系统，在该系统中，两个连续的数值仅有一个位数的差异。
         给定一个代表编码总位数的非负整数 n，打印其格雷编码序列。即使有多个不同答案，你也只需要返回其中一种。
         格雷编码序列必须以 0 开头。
         示例 1:
         输入: 2
         输出: [0,1,3,2]
         解释:
         00 - 0
         01 - 1
         11 - 3
         10 - 2

         对于给定的 n，其格雷编码序列并不唯一。
         例如，[0,2,3,1] 也是一个有效的格雷编码序列。
         00 - 0
         10 - 2
         11 - 3
         01 - 1
         示例 2:

         输入: 0
         输出: [0]
         解释: 我们定义格雷编码序列必须以 0 开头。
              给定编码总位数为 n 的格雷编码序列，其长度为 2n。当 n = 0 时，长度为 20 = 1。
              因此，当 n = 0 时，其格雷编码序列为 [0]。

         解题思路：
            0      1       2        3       4
            0      0       00       000     0000
                   1       01       001     0001
                           11       011     0011
                           10       010     0010
                                    110     0110
                                    111     0111
                                    101     0101
                                    100     0100
                                            1100
                                            1101
                                            ....
         根据上述规律，可以得出
         G(n) = G(n-1) + (逆序遍历G(n-1)中的元素 + n << 1)
         **/
        var start = 1
        var result = [Int]()
        result.append(0)
        
        for _ in 0..<n {
            let lastResult = result
            for item in lastResult.reversed() {
                result.append(start + item)
            }
            start = start << 1
        }
        
        return result
    }
}
