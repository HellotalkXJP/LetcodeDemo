//
//  25. K 个一组翻转链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/10/12.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution25 {
    /*
             1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
     step1:
         dumy.next = head
         pre = dumy
         end = dumy
         dumy表结构如下
         dumy -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
     pre、end   head

     step2:  K(假定3) 循环K次后，dumy表结构如下
             dumy -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
             pre              end
         1、判断end.next是否非空。空的话直接跳出循环，返回dumy.next
         2、end.next非空
             start = pre.next
             next = end.next
             dumy表结构如下
             dumy -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
             pre   start      end  next

             end.next = nil
             dumy表结构如下
             dumy -> 1 -> 2 -> 3   4 -> 5 -> 6 -> 7
             pre   start     end  next

             在转换start链表reverse(start)后 temp = 3->2->1
             pre.next = reverse(start)
             dumy表结构如下
             dumy -> 3 -> 2 -> 1   4 -> 5 -> 6 -> 7
             pre   end       start  next

             接着一些变量重置操作
             start.next = next
             pre = start
             end = pre
             此时dumy表结构如下
             dumy -> 3 -> 2 -> 1 -> 4 -> 5 -> 6 -> 7
                           pre、end
     step3: 直到step2中end.next == nil跳出循环返回结果。
     **/
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var pre: ListNode? = dummy
        var end: ListNode? = dummy
        
        while end?.next != nil {
            for _ in 1...k {
                end = end?.next
            }
            
            if end == nil {
                break
            }
            
            let start = pre?.next
            let next = end?.next
            end?.next = nil
            pre?.next = reverse(start)
            start?.next = next
            pre = start
            end = pre
        }
        
        return dummy.next
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        return pre
    }
}
