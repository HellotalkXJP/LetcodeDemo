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
        if head == nil || head?.next == nil {
            return head
        }
        
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
}
