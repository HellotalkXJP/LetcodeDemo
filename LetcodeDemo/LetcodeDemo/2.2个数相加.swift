//
//  2个数相加.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/8.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

public class ListNode: NSObject {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public override var description: String {
        var description = ""
        var node: ListNode? = self
        while let current = node {
            description.append("\(current.val)")
            if current.next != nil {
                description.append("->")
            }
            
            node = current.next
        }
        
        return description
    }
    
}

class AddTwo: NSObject {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l11: ListNode? = l1
        var l22: ListNode? = l2
        
        let node = ListNode(0)
        var tag = 0
        var val = 0
        var next: ListNode = node
        
        while l11 != nil || l22 != nil || tag > 0 {
            let value = (l11?.val ?? 0) + (l22?.val ?? 0) + tag
            tag = value / 10
            val = value % 10
            
            let tempNode = ListNode(val)
            next.next = tempNode
            next = tempNode
            
            l11 = l11?.next
            l22 = l22?.next
        }
        
        return node.next
    }
}


