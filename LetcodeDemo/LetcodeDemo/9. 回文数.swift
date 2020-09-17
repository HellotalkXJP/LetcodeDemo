//
//  9. 回文数.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/15.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution9 {
    static func isPalindrome(_ x: Int) -> Bool {
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
