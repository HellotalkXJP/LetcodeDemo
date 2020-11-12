//
//  206. 反转链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        /*
         206. 反转链表
         反转一个单链表。

         示例:
         输入: 1->2->3->4->5->NULL
         输出: 5->4->3->2->1->NULL
         进阶:
         你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

         解题思路：
         **/
//        var pre: ListNode? = nil
//        var curr = head
//        while curr != nil {
//            let next = curr?.next
//            curr?.next = pre
//            pre = curr
//            curr = next
//        }
//        return pre
        
        if head == nil || head?.next == nil {
            return head
        }
        
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
}
