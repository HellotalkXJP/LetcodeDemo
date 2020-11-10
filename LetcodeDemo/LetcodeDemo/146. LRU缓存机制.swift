//
//  146. LRU缓存机制.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/10.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class LRUCache {
    /*
     146. LRU缓存机制
     运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
     实现 LRUCache 类：

     LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
     int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
     void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
     进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？
     示例：
     输入
     ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
     [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
     输出
     [null, null, null, 1, null, -1, null, -1, 3, 4]

     解释
     LRUCache lRUCache = new LRUCache(2);
     lRUCache.put(1, 1); // 缓存是 {1=1}
     lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
     lRUCache.get(1);    // 返回 1
     lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
     lRUCache.get(2);    // 返回 -1 (未找到)
     lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
     lRUCache.get(1);    // 返回 -1 (未找到)
     lRUCache.get(3);    // 返回 3
     lRUCache.get(4);    // 返回 4

     解题思路：
     双向链表+哈希表
     **/
    var lru = LinkMap()
    let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        var node: Node?
        node = lru.dict[key]
        if let node = node {
            lru.moveNodeToHead(node)
            return node.value as? Int ?? -1
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = lru.dict[key] {
            // 存在节点，则把节点移到头部
            // 如果值不相等，则把新值替换进去
            if let oldValue = node.value as? Int, oldValue != value {
                node.value = value
            }
            
            lru.moveNodeToHead(node)
        } else {
            // 不存在节点，则插入新的节点
            let node = Node(value: value, key: key)
            lru.insert(node)
        }
        
        if lru.totalCount > capacity {
            // 数量超过限制，则删除尾节点
            let _ = lru.removeTailNode()
        }
    }
    
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
}
