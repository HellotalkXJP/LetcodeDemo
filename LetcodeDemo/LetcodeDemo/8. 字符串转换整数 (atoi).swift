//
//  8. 字符串转换整数 (atoi).swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/15.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution8 {
    static func myAtoi(_ str: String) -> Int {
        var valueStr = ""
        let str = str.trimmingCharacters(in: .whitespaces)
        
        for (index, char) in str.enumerated() {
            if index == 0 && (String(char) == "+" || String(char) == "-") {
                valueStr = String(char)
            } else {
                if let _ = Int(String(char)) {
                    valueStr += String(char)
                } else {
                    break
                }
            }
        }
        
        if valueStr.count == 0 || valueStr == "+" || valueStr == "-" {
            return 0
        }
        
        
        if let value = Int32(valueStr) {
            return Int(value)
        } else {
            return valueStr.hasPrefix("-") ? Int(Int32.min) : Int(Int32.max)
        }
    }
}
