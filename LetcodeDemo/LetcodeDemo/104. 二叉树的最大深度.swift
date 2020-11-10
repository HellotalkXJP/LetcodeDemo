//
//  104. 二叉树的最大深度.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/9.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        /*
         104. 二叉树的最大深度
         给定一个二叉树，找出其最大深度。
         二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
         说明: 叶子节点是指没有子节点的节点。
         示例：
         给定二叉树 [3,9,20,null,null,15,7]，

             3
            / \
           9  20
             /  \
            15   7
         返回它的最大深度 3 。
         
         解题思路：
         递归计算出左子树的最大深度跟右子树的最大深度，在加上1，就是二叉树的最大深度
         **/
        if root == nil {
            return 0
        }
        
        let leftHeight = maxDepth(root?.left)
        let rightHeight = maxDepth(root?.right)
        
        return max(leftHeight, rightHeight) + 1
    }
    
    
}

