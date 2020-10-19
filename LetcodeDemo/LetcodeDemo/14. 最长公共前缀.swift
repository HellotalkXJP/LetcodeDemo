//
//  14. 最长公共前缀.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution14 {
    static func longestCommonPrefix(_ strs: [String]) -> String {
        /*
         14. 最长公共前缀
         编写一个函数来查找字符串数组中的最长公共前缀。
         如果不存在公共前缀，返回空字符串 ""。
         
         输入: ["flower","flow","flight"]
         输出: "fl"
         **/
        
        // 纵向扫描
        /*
         ["flower","flow","flight"]
             
         j\i 0 1 2 3 4 5
          0  f l o w e r
          1  f l o w
          2  f l i g h t
         
         解题思路:
         // 纵向扫描
         ["flower","flow","flight"]

         j\i  0  1  2  3  4  5
          0   f  l  o  w  e  r
          1   f  l  o  w
          2   f  l  i  g  h  t
         把参数数组当成是一个二维数组

         1、当某个数组遍历结束的时候或者不匹配字段的时候退出循环，标记下一次外部循环不用再循环了，直接退出循环
         2、当内部循环结束，并且字符匹配时，追加字符到maxPrefix中，然后继续下一次循环
         */
        let count = strs.count
        if count <= 0 {
            return ""
        }
        if count == 1 {
            return strs[0]
        }
        
        let firstStr = strs[0]
        let length = firstStr.count
        var maxPrefix = ""
        var continueTag = true
        for i in 0..<length {
//            print("i = \(i)")
            if continueTag {
                let index = firstStr.index(firstStr.startIndex, offsetBy: i)
                for j in 1..<count {
                    // 当某个数组遍历结束的时候或者不匹配字段的时候退出循环，并截取前面的字符串
//                    print("\(strs[j]) strs[\(i)]=\(String(strs[j][index]))")
                    if i >= strs[j].count || String(firstStr[index]) != String(strs[j][index]) {
                        continueTag = false
                        break
                    }
                }
                
                if continueTag {
                    maxPrefix += String(firstStr[index])
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return maxPrefix
    }
}
