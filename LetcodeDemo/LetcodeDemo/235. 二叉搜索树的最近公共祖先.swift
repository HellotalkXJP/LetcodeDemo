//
//  235. 二叉搜索树的最近公共祖先.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        /*
         235. 二叉搜索树的最近公共祖先
         给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

         百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

         例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

         示例 1:
         输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
         输出: 6
         解释: 节点 2 和节点 8 的最近公共祖先是 6。
         
         示例 2:
         输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
         输出: 2
         解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。

         解题思路：
         因为题干中已表明，是二叉搜索树，二叉搜索树有个特性：
         1、若任意结点的左子树不空，则左子树上所有结点的值均不大于它的根结点的值。
         2、若任意结点的右子树不空，则右子树上所有结点的值均不小于它的根结点的值。
         根据这2个特性，我们就可以直接遍历二叉树：
         1、如果当前节点大于p、q的值，那么p、q在当前节点的左子树上，则继续当前节点的左子树
         2、如果当前节点小于p、q的值，那么p、q在当前节点的右子树上，则继续当前节点的右子树
         3、如果不满足上述2个条件，那么当前节点就是p、q的公共的祖先节点。
         **/
        if root == nil || p == nil || q == nil {
            return nil
        }
        
        if root!.val > p!.val && root!.val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if root!.val < p!.val && root!.val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        
        return root
    }
}
