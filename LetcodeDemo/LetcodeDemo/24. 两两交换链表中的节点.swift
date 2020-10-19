//
//  24. 两两交换链表中的节点.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/25.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        /*
         24. 两两交换链表中的节点
         给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
         你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
         
         输入：head = [1,2,3,4]
         输出：[2,1,4,3]
         
         输入：head = [1]
         输出：[1]
         
         **/
        if head == nil || head?.next == nil {
            return head
        }
        
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
}
