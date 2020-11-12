//
//  148. 排序链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        /*
         148. 排序链表
         给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
         进阶：
         你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？

         解题思路：
         题目要求时间复杂度O(n log n)，就能直接想到使用2分法
         使用快慢指针，slowm每次走一步，fast每次走二步，当fast=nil或者fast.next=nil时，slow.next就是后半部分链表了。
         比如链表奇数个： 1->2->3->4->5
         初始化fast=head.next，slow=head
         当slow走到2节点时，fast走到4节点，继续往下走，slow走到3节点，fast=nil，退出循环，此时slow.next就是后半部分链表了。
         链表偶数个： 1->2->3->4->5->6
         当slow走到3节点时，fast走到6节点，继续往下走，fast.next=nil，退出循环，此时slow.next就是后半部分链表了。
         所以我们可以用快慢指针先把链表分割。一直递归，知道链表个数只有一个，然后在排序合并
         **/
        if head == nil || head?.next == nil {
            return head
        }
        
        var slow = head, fast = head?.next
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let temp = slow?.next
        slow?.next = nil
        var left = sortList(head)
        var right = sortList(temp)
        var h = ListNode(0)
        let res = h
        
        while left != nil && right != nil {
            if left!.val < right!.val {
                h.next = left
                left = left?.next
            } else {
                h.next = right
                right = right?.next
            }
            h = h.next!
        }
        
        h.next = left != nil ? left : right
        
        return res.next
    }
}
