//
//  19. 删除链表的倒数第N个节点.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/23.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
/**
* Definition for singly-linked list.
* public class ListNode {
*     public var val: Int
*     public var next: ListNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.next = nil
*     }
* }
*/
class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        /*
         链表: 1->2->3->4->5  n = 2
         ==>1->2->3->5
         思路:
         1、使用快慢指针(fastNode、slowNode)
         2、fastNode先走n+1，走完之后slowNode开始与fastNode同步走
         3、当fastNode走到最后的时候，slowNode就是要删掉的节点的前一个节点
         4、让slowNode下一个节点等于slowNode的下下个节点==>slowNode?.next = slowNode?.next?.next
         5、返回head
         
         **/
        let dummy = ListNode(0)
        dummy.next = head
        var fastNode: ListNode? = dummy
        var slowNode: ListNode? = dummy
        
        for _ in 1...n+1 {
            // 快指针先走n+1步
            fastNode = fastNode?.next
        }
        
        while fastNode != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next
        }
        
        slowNode?.next = slowNode?.next?.next
        
        return dummy.next
    }
}
