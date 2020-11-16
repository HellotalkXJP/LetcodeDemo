//
//  1、两数之和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/8.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            let num1 = target - num
            if dic.keys.contains(num1), let index = dic[num1] {
                return [index, i]
            }
            dic[num] = i
        }
        return [0,0]
    }
}
