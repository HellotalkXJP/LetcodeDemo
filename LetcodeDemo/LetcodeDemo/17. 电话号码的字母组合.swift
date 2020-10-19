//
//  17. 电话号码的字母组合.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/22.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution17 {
    let dic: [String: String] = ["1": "!@#", "2": "abc", "3": "edf", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    var array = [String]()
    
    func letterCombinations(_ digits: String) -> [String] {
        /*
         17. 电话号码的字母组合
         给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

         给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
         输入："23"
         输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
         
         "23" ==> ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
         **/
        if digits.isEmpty {
            return array
        }
        
        iterStr(digits, 0, "")
        
        return array
    }
    
    func iterStr(_ digits: String, _ index: Int, _ s: String) {
        print("index:\(index)")
        print("tempStr:\(s)")
        
        if digits.count == index {
            print("循环结束tempStr:\(s)")
            array.append(s)
            return
        }
        
        let strIndex = digits.index(digits.startIndex, offsetBy: index)
        let keyStr = digits[strIndex]
        if let valueStr = dic[String(keyStr)] {
            for char in valueStr {
                let charStr = String(char)
                print("charStr:\(charStr)")
                iterStr(digits, index + 1, s + charStr)
            }
        }
    }
}
