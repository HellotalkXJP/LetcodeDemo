//
//  236. 二叉树的最近公共祖先.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        /*
         236. 二叉树的最近公共祖先
         给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

         百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

         例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]

         示例 1:
         输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
         输出: 3
         解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
         
         示例 2:
         输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
         输出: 5
         解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。

         解题思路：
         该题比[235. 二叉搜索树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/solution/swiftzhi-235-er-cha-sou-suo-shu-de-zui-jin-gong-go/)复杂一些， 因为该题不是二叉搜索树，只是普通的二叉树
         递归左子树、右子树
         **/
        if root === p || root === q || root == nil {
            return root
        }
        
        let leftNode = lowestCommonAncestor(root?.left, p, q)
        let rightNode = lowestCommonAncestor(root?.right, p, q)
        
        if root != nil {
            if leftNode != nil && rightNode != nil {
                return root
            } else if leftNode == nil {
                // p、q全在当前节点的右子树中
                return rightNode
            } else {
                // p、q全在当前节点的左子树中
                return leftNode
            }
        }
        
        return nil
    }
    
    func dfs(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?, _ result: inout TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        
        let left = dfs(root?.left, p, q, &result)
        let right = dfs(root?.right, p, q, &result)
        
        if left && right || (root === p || root === q) {
            result = root
        }
        
        return root === p || root === q || left || right
    }
}
