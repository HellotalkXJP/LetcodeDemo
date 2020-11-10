//
//  136. 只出现一次的数字.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution136 {
    func singleNumber(_ nums: [Int]) -> Int {
        /*
         136. 只出现一次的数字
         给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
         说明：
         你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
         示例 1:
         输入: [2,2,1]
         输出: 1
         
         示例 2:
         输入: [4,1,2,1,2]
         输出: 4

         解题思路：
         异或运算
         a^0 = a、a^a = 0、a^b^a = b。
         这个公示满足交换律 ==> a^b^a = a^a^b = 0^b = b
         由于重复出现的次数均为2次。给所有的元素做异或运算，在通过交换率的可以得出 ==> 0^0^0...^a(i), a(i)就是那个只出现一次的数
         **/
        var res = 0
        for num in nums {
            res ^= num
        }
        
        return res
    }
}
