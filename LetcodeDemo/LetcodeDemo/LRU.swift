//
//  LRU.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Node: NSObject {
    // 上一个节点
    var pre: Node?
    // 下一个节点
    var next: Node?
    var key: AnyHashable
    var value: Any
    
    init(value: Any, key: AnyHashable) {
        self.value = value
        self.key = key
        super.init()
    }
    
    override var description: String {
        return "\(key):\(value)"
    }
}

class LinkMap: NSObject {
    var headNode: Node?
    var tailNode: Node?
    var dict = [AnyHashable: Node]()
    
    var totalCount: UInt64 = 0
    
    /// 插入新元素
    ///
    /// - Parameter node: 元素节点
    func insert(_ node: Node) {
        totalCount += 1
        dict[node.key] = node
        
        if let head = headNode {
            node.next = head
            head.pre = node
            
            // 重新赋值头节点
            headNode = node
        } else {
            headNode = node
            tailNode = node
        }
    }
    
    /// 删除元素
    ///
    /// - Parameter node: 元素节点
    func removeNode(_ node: Node) {
        totalCount -= 1
        dict.removeValue(forKey: node.key)
        
        if let _ = node.pre {
            node.pre?.next = node.next
        }
        
        if let _ = node.next {
            node.next?.pre = node.pre
        }
        
        if headNode == node {
            headNode = node.next
        }
        
        if tailNode == node {
            tailNode = node.pre
        }
    }
    
    /// 把当前节点移动到首部
    ///
    /// - Parameter node: 元素节点
    func moveNodeToHead(_ node: Node) {
        if headNode == node {
            return
        }
        
        // 删除当前节点
        if tailNode == node {
            tailNode = node.pre
            tailNode?.next = nil
        } else {
            node.next?.pre = node.pre
            node.pre?.next = node.next
        }
        
        // 把当前节点移动到头部
        node.next = headNode
        node.pre = nil
        headNode?.pre = node
        
        // 重新赋值头节点
        headNode = node
    }
    
    /// 删除尾节点
    func removeTailNode() -> Node? {
        totalCount -= 1
        if let tail = tailNode {
            let key = tail.key
            dict.removeValue(forKey: key)
        }
        
        if headNode == tailNode {
            return nil
        } else {
            tailNode = tailNode?.pre
            tailNode?.next = nil
            return tailNode
        }
    }
    
    /// 删除所有元素节点
    func removeAllNode() {
        totalCount = 0
        
        headNode = nil
        tailNode = nil
        dict = [AnyHashable: Node]()
    }
}

class Cache: NSObject {
    var lru = LinkMap()
    var lock = NSLock()
    let limitCount: UInt64
    
    init(limitCount: UInt64 = 100) {
        self.limitCount = limitCount
        super.init()
    }
    
    func objc(forKey key: AnyHashable) -> Any? {
        lock.lock()
        var node: Node?
        
        node = lru.dict[key]
        if let node = node {
            lru.moveNodeToHead(node)
        }
        lock.unlock()
        return node?.value
    }
    
    func setobject(_ value: Any, forKey key: AnyHashable) {
        lock.lock()
        
        if let node = lru.dict[key] {
            // 存在节点，则把节点移到头部
            // 如果值不相等，则把新值替换进去
            node.value = value
            lru.moveNodeToHead(node)
        } else {
            // 不存在节点，则插入新的节点
            let node = Node(value: value, key: key)
            lru.insert(node)
        }
        
        if lru.totalCount > limitCount {
            // 数量超过限制，则删除尾节点
            let _ = lru.removeTailNode()
        }
        
        lock.unlock()
    }
    
    func removeObjc(forKey key: AnyHashable) {
        lock.lock()
        
        if let node = lru.dict[key] {
            lru.removeNode(node)
        }
        
        lock.unlock()
    }
    
    override var description: String {
        var description = ""
        var node: Node? = lru.headNode
        while let current = node {
            description.append("\(current.description) ")
            node = current.next
        }
        
        return description
    }
}
