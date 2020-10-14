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
