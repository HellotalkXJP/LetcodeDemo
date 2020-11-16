//
//  237. 删除链表中的节点.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class Solution237 {
    func deleteNode(_ node: inout ListNode) {
        /*
         237. 删除链表中的节点
         请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点 。
         现有一个链表 -- head = [4,5,1,9]，它可以表示为:
         示例 1：

         输入：head = [4,5,1,9], node = 5
         输出：[4,1,9]
         解释：给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
         
         示例 2：
         输入：head = [4,5,1,9], node = 1
         输出：[4,5,9]
         解释：给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.

         解题思路：
         首先看到这题，我们第一想到的就是遍历原链表，然后找到指定的节点，然后指定节点的上一节点指向指定节点的下一节点，但此题函数只给了一个入参，我们无法遍历链表，找到该节点的前一个节点。于是我们就应该想到，入参的这个节点就是我们要删掉的节点。所以我们就可以把当前节点的下个节点的值，赋值给当前节点，然后让当前节点的next指向当前节点的下一个节点的next，其实就是用下一个节点覆盖了当前节点。
         代码也就是
         node.val = node.next!.val
         node.next = node.next?.next
         **/
        node.val = node.next!.val
        node.next = node.next?.next
//        node?.val = node?.next?.val as! Int
//        node?.next = node?.next?.next
    }
}
