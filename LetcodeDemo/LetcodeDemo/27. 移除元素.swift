//
//  27. 移除元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/14.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        /*
         直接遍历数组，遇到相同的值，跳过;相同则i+1
         **/
        if nums.count == 0 {
            return 0
        }
        var i = 0
        let length = nums.count
        
        for index in 0..<length {
            if nums[index] != val {
                nums[i] = nums[index]
                i += 1
            }
        }
        
        return i
    }
}
