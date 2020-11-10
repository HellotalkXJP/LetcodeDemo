//
//  141. 环形链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        /*
         141. 环形链表
         给定一个链表，判断链表中是否有环。
         如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。
         如果链表中存在环，则返回 true 。 否则，返回 false 。
         进阶：

         你能用 O(1)（即，常量）内存解决此问题吗？

         示例 1：
         输入：head = [1,2], pos = 0
         输出：true
         解释：链表中有一个环，其尾部连接到第一个节点。

         解题思路：
         方法一：遍历链表，访问过的节点用哈希表存储，重复该过程，如果哈希表里面有该节点了，说明存在环（但是代码放到LeetCode中，会编译失败，因为LeetCode中的ListNode没有实现Hashable协议）error: type 'ListNode' does not conform to protocol 'Hashable' in solution.swift。所以只能使用方法二
         var list = Set<ListNode>()
         var next = head?.next
         while next != nil {
             if list.contains(next!) {
                 return true
             }
             list.insert(next!)
             next = next?.next
         }
         
         return false
         方法二：使用快慢指针
         慢指针每次走1步，快指针每次走2步，如果存在环的话，快指针会追上慢指针。如果不存在环的话，快指针会走到尾部
         **/
        var slow = head
        var fast = head?.next
        
        while fast != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}
