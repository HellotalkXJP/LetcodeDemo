//
//  230. 二叉搜索树中第K小的元素.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution230 {
    var index = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        /*
         230. 二叉搜索树中第K小的元素
         给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。
         说明：
         你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。
         示例 1:
         输入: root = [3,1,4,null,2], k = 1
            3
           / \
          1   4
           \
            2
         输出: 1
         
         示例 2:
         输入: root = [5,3,6,2,4,null,null,1], k = 3
                5
               / \
              3   6
             / \
            2   4
           /
          1
         输出: 3

         解题思路：
         因为题干中已表明，是二叉搜索树，二叉搜索树有个特性：
         1、若任意结点的左子树不空，则左子树上所有结点的值均不大于它的根结点的值。
         2、若任意结点的右子树不空，则右子树上所有结点的值均不小于它的根结点的值。
         
         所以我们直接使用深度优先搜索(DFS)中的中序遍历，就可以直接从小到大排序二叉搜索树
         **/
        var result = 0
        search(root, k, &result)
        return result
    }
    
    func search(_ node: TreeNode?, _ k: Int, _ result: inout Int) {
        if node?.left != nil {
            search(node?.left, k, &result)
        }
        
        index += 1
        
        if index == k {
            result = node!.val
        } else if index > k {
            return
        }
        
        if node?.right != nil {
            search(node?.right, k, &result)
        }
    }
}
