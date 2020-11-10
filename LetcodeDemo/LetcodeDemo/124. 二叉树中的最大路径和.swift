//
//  124. 二叉树中的最大路径和.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Solution124 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        /*
         124. 二叉树中的最大路径和
         给定一个非空二叉树，返回其最大路径和。
         本题中，路径被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
         示例 1：
         输入：[1,2,3]

                1
               / \
              2   3

         输出：6
         
         示例 2：
         输入：[-10,9,20,null,null,15,7]
            -10
            / \
           9  20
             /  \
            15   7

         输出：42
         
         解题思路：
         递归，记录最大值
         
         
         **/
        var maxSum = Int.min
        let _ = maxGain(root, &maxSum)
        return maxSum
    }
    
    func maxGain(_ tree: TreeNode?, _ maxSum: inout Int) -> Int {
        if tree == nil {
            return 0
        }
        
        let leftMax = max(maxGain(tree?.left, &maxSum), 0)
        let righMax = max(maxGain(tree?.right, &maxSum), 0)
        
        let priceNewpath = (tree?.val ?? 0) + leftMax + righMax
        maxSum = max(maxSum, priceNewpath)
        
        return max(leftMax, righMax) + (tree?.val ?? 0)
    }
}
