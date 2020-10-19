//
//  21. 合并两个有序链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/24.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution21 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /*
         21. 合并两个有序链表
         将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
         输入：1->2->4, 1->3->4
         输出：1->1->2->3->4->4
         
         1->2->4, 1->3->4
         ==> 1->1->2->3->4->4
         解题思路：递归
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
