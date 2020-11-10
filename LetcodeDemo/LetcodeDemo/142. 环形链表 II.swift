//
//  142. 环形链表 II.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        /*
         142. 环形链表 II
         给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
         为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。
         说明：不允许修改给定的链表。
         进阶：
         你是否可以使用 O(1) 空间解决此题？
         
         示例 1：
         输入：head = [3,2,0,-4], pos = 1
         输出：返回索引为 1 的链表节点
         解释：链表中有一个环，其尾部连接到第二个节点。
         
         示例 2：
         输入：head = [1,2], pos = 0
         输出：返回索引为 0 的链表节点
         解释：链表中有一个环，其尾部连接到第一个节点。
         
         解题思路：
         与[141. 环形链表](https://leetcode-cn.com/problems/single-number/solution/swiftzhi-136-zhi-chu-xian-yi-ci-de-shu-zi-by-goodj/)解题思路一致，区别就是该题要找到入环点
         使用快慢指针，慢指针每次走1步，快指针每次走2步，如果存在环的话，快指针会追上慢指针。如果不存在环的话，快指针会走到尾部
         利用数学公式，假设走到环入口节点x步，入口节点到重合节点y步，重合节点到入口节点z步。
         ==> slow走的步数为 x+y，fast走的步数为x+y+(y+z)*n，n为fast指针在环内走的圈数
         ==> 因为slow是每次走一步，fast每次走2步，可以得出 2*(x+y) = x+y + (y+z)*n
         ==> x = (n-1)*y + n*z
         ==> x = (n-1)*y + (n-1)*z + z
         ==> x = (n-1)*(y+z) + z
         ==> 从链表头部到入环点的距离等于重合点到入环点距离加上(n-1)圈环的长度
         ==> 可以在相遇的时候，重新使用一个指针new，指向头部。然后开始跟慢指针一起同时每次走一步，当new与slow相遇时，new指针指向的节点就是入环点。
         ==> 返回new指针
         
         **/
        var slow = head
        var fast = head?.next
        
        while fast != nil {
            if slow === fast {
                var new = head
                slow = slow?.next
                while slow != new {
                    slow = slow?.next
                    new = new?.next
                }
                return new
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return nil
    }
}
