//
//  23. 合并K个升序链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/25.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        /*
         23. 合并K个升序链表
         给你一个链表数组，每个链表都已经按升序排列。
         请你将所有链表合并到一个升序链表中，返回合并后的链表。
         输入：lists = [[1,4,5],[1,3,4],[2,6]]
         输出：[1,1,2,3,4,4,5,6]
         解释：链表数组如下：
         [
           1->4->5,
           1->3->4,
           2->6
         ]
         将它们合并到一个有序链表中得到。
         1->1->2->3->4->4->5->6

         解题思路：
         采用分治算法
         1、两两合并
         2、n个元素数组合并之后成n/2个
         3、递归合并
         4、当数组个数为1时，说明已经全部合并完成，返回第一个元素
         **/
        if lists.count < 1 {
            return nil
        }
        
        if lists.count == 1 {
            return lists[0]
        }
        
        var tempList = [ListNode?]()
        let count = lists.count
        for i in 0..<count {
            var node = lists[i]
            if i < count - 1 - i {
                node = mergeTwoLists(lists[i], lists[count - 1 - i])
                tempList.append(node)
            }
            if i == count - 1 - i {
                tempList.append(node)
            }
        }
        
        return mergeKLists(tempList)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /*
         1->2->4, 1->3->4
         ==> 1->1->2->3->4->4
         思路：递归
         **/
        
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if let l1 = l1, let l2 = l2, l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}
