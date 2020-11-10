//
//  60. 排列序列.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/5.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution60 {
    var factorials = [Int]()
    var used = [Bool]()
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        /*
         60. 排列序列
         给出集合 [1,2,3,...,n]，其所有元素共有 n! 种排列。
         按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
         "123"
         "132"
         "213"
         "231"
         "312"
         "321"
         给定 n 和 k，返回第 k 个排列。
         
         示例 1：
         输入：n = 3, k = 3
         输出："213"
         
         示例 2：
         输入：n = 4, k = 9
         输出："2314"
         
         示例 3：
         输入：n = 3, k = 1
         输出："123"
         
         解题思路：
         1、先计算出n的阶层n!，并存放到数组中，以方便后面使用
         2、使用一个数组used，记录该数字是否使用
         3、开始递归。根据已选中的个数，计算剩余个数的的排列数量count（计算剩余个数的阶层）
         4、开始遍历，判断如果该数字已经使用过，continue,继续遍历；如果k>count，说明该分支没必要遍历，k=k-count, continue,继续下一波遍历；否则，把当前数字加到结果中，标记该数字已被使用，并且index+1，继续递归。
         5、直到index==n，说明数字已经全部取完，递归结束
         6、输出结果
         **/
        // 先把1~n的阶层算出来，存放到factorials数组中
        calculateFactorial(n)
        
        // 记录该数字是否被用过
        used = Array(repeating: false, count: n + 1)
        
        var result = ""
        dfs(n, k, 0, &result)
        return result
    }
    
    func dfs(_ n: Int, _ k: Int, _ index: Int, _ result: inout String) {
        if index == n {
            return
        }
        
        let count = factorials[n - 1 - index]
        
        var k = k
        for i in 1...n {
            if used[i] {
                continue
            }
            
            if k > count {
                k -= count
                continue
            }
            
            result.append("\(i)")
            used[i] = true
            dfs(n, k, index + 1, &result)
            return
        }
    }
    
    // 计算n的阶层，存放到数组中
    func calculateFactorial(_ n: Int) {
        factorials = Array(repeating: 1, count: n+1)
        factorials[0] = 1
        for i in 1..<n+1 {
            factorials[i] = factorials[i-1] * i
        }
    }
}
