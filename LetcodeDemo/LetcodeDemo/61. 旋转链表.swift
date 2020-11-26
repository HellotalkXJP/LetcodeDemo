//
//  61. 旋转链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/6.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        /*
         61. 旋转链表
         给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

         示例 1:
         输入: 1->2->3->4->5->NULL, k = 2
         输出: 4->5->1->2->3->NULL
         解释:
         向右旋转 1 步: 5->1->2->3->4->NULL
         向右旋转 2 步: 4->5->1->2->3->NULL
         
         示例 2:
         输入: 0->1->2->NULL, k = 4
         输出: 2->0->1->NULL
         解释:
         向右旋转 1 步: 2->0->1->NULL
         向右旋转 2 步: 1->2->0->NULL
         向右旋转 3 步: 0->1->2->NULL
         向右旋转 4 步: 2->0->1->NULL

         解题思路：
         1、把旧链表闭环，并计算出长度n
         2、从头节点出发，找到新的链表头，链表尾
         3、当k<n时，新的链表尾在n-k处，新的链表头在n-k+1处
         4、当k>=n时，k=k / n * n + k % n，前面的k/n * n不会影响结果，所以新的链表尾在n-k%n处，新的链表头在n-k%n+1处
         5、结合3、4的2种情况，我们可以的到，新的链表的尾节点在 n-k%n处，新的链表头在n-k%n+1处
         6、找到新链表头、尾后，断开链表尾，返回链表头
         **/
        if head == nil {
            return nil
        }
        
        if head?.next == nil {
            return head
        }
        
        var n = 1
        var oldTail = head
        
        while oldTail?.next != nil {
            n += 1
            oldTail = oldTail?.next
        }
        
        // 找到旧的尾节点后，让旧的尾结点的next指向头节点，形成闭环
        oldTail?.next = head
        
        var newTail = head
        var i = 1
        while newTail?.next != nil {
            if i == n - k%n {
                break
            }
            
            i += 1
            newTail = newTail?.next
        }
        
        // 找到新链表头
        let newHead = newTail?.next
        // 新链表尾断开闭环
        newTail?.next = nil
        
        return newHead
    }
}
