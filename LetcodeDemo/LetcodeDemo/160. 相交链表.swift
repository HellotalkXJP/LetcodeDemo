//
//  160. 相交链表.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        /*
         160. 相交链表
         编写一个程序，找到两个单链表相交的起始节点。
         示例 1：
         输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
         输出：Reference of the node with value = 2
         输入解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]。在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

         示例 2：
         输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
         输出：null
         输入解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
         解释：这两个链表不相交，因此返回 null。

         解题思路：
         使用双指针pa、pb，pa遍历headA，当遍历到尾部时，pa=headB，就相当于pa遍历headA+headB，同样的pb遍历headB+headA，因为pa、pb同时在遍历，所以当有相同节点时，pa==pb，跳出循环；如果没有相同节点时，pa、pb会走到最后为nil。所以循环跳出的条件就是 pa==pb，最后返回结果pa
         headA：1->2->3->4->6   headB：2->4->6
         1->2->3->4->6->null->2->4->6->null
         pa
         
         2->4->6->null->1->2->3->4->6->null
         pb
         **/
        if headA == nil || headB == nil {
            return nil
        }
        
        var pa = headA, pb = headB
        while pa !== pb {
            pa = pa == nil ? headB : pa?.next
            pb = pb == nil ? headA : pb?.next
        }
        
        return pa
    }
}
