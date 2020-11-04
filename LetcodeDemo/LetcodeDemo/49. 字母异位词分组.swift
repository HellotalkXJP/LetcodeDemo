//
//  49. 字母异位词分组.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/2.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        /*
         49. 字母异位词分组
         给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
         示例:
         输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
         输出:
         [
           ["ate","eat","tea"],
           ["nat","tan"],
           ["bat"]
         ]
         
         解题思路：
         遍历的时候，把字符串按字符排序，使用一个哈希表判断是否存在该字符串
         **/
        var list = [String: [String]]()
        for str in strs {
            // 字符串排序
            let newStr = String(str.sorted())
            var array = list[newStr] ?? [String]()
            array.append(str)
            list[newStr] = array
        }
        
        return Array(list.values)
    }
}
