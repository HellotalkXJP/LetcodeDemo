//
//  9. 回文数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/15.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution9 {
    func isPalindrome(_ x: Int) -> Bool {
        /*
         9. 回文数
         判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
         输入: 121
         输出: true
         **/
        if x < 0 {
            return false
        }
        
        var y = 0
        var temp = x
        
        while temp != 0 {
            y = y * 10 + temp % 10
            temp = temp / 10
        }
        
        return x == y
    }
}
