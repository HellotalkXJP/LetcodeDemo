//
//  30. 串联所有单词的子串.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/15.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution30 {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        /*
         30. 串联所有单词的子串
         给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
         注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序。
         示例 1：
         输入：
           s = "barfoothefoobarman",
           words = ["foo","bar"]
         输出：[0,9]
         解释：
         从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
         输出的顺序不重要, [9,0] 也是有效答案。

         解题思路:
         1、先把words数组变成哈希表
         2、因为数组中每个元素长度相同，所以可以拿到最大长度为 size = word.count * words.count
         取出s中size长度的字符串
         3、匹配哈希表，判断是否符合条件。符合条件的加入到结果中
         4、返回结果
         **/
        
        
        var result = [Int]()
        guard !s.isEmpty && !words.isEmpty && !words.first!.isEmpty  else {
            return result
        }
        
        var wordMap = [String: Int]()
        for word in words {
            let value = wordMap[word] ?? 0
            wordMap[word] = value + 1
        }
        
        let wordCount = words.first!.count
        let wordsCount = words.count
        let wordsSize = wordCount * wordsCount
        
        var tempStr = ""
        var tempCount = 0
        
        for (index, char) in s.enumerated() {
            tempCount += 1
            tempStr.append(char)
            
            // 取完整个长度字符串然后开始匹配
            if tempCount == wordsSize {
                // 判断取出的字符串是否符合要求
                if containWords(tempStr, wordMap, wordCount) {
                    // result.append(index - windowSize + 1)
                    result.append(index - wordsSize + 1)
                }
                
                // tempStr删除掉第一个字符，继续下一次循环
                tempStr.removeFirst()
                tempCount -= 1
            }
        }
        
        return result
    }
    
    func containWords(_ string: String, _ wordMap: [String: Int], _ wordSize: Int) -> Bool {
        var tempMap = wordMap
        var word = ""
        var count = 0
        
        for char in string {
            count += 1
            word.append(char)
            
            if count == wordSize {
                if let value = tempMap[word] {
                    // 截取字符串在哈希表里存在，则把value值减1
                    if value == 1 {
                        // 直接删除这个key
                        tempMap.removeValue(forKey: word)
                    } else {
                        // 重新赋值
                        tempMap[word] = value - 1
                    }
                } else {
                    // 不存在直接返回false
                    return false
                }
                
                word.removeAll()
                count = 0
            }
        }
        
        return tempMap.isEmpty
    }
}
