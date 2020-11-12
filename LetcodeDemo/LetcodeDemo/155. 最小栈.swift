//
//  155. 最小栈.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/11/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
class MinStack {
    /*
     155. 最小栈
     设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。
     push(x) —— 将元素 x 推入栈中。
     pop() —— 删除栈顶的元素。
     top() —— 获取栈顶元素。
     getMin() —— 检索栈中的最小元素。
     
     示例:
     输入：
     ["MinStack","push","push","push","getMin","pop","top","getMin"]
     [[],[-2],[0],[-3],[],[],[],[]]

     输出：
     [null,null,null,null,-3,null,0,-2]

     解释：
     MinStack minStack = new MinStack();
     minStack.push(-2);
     minStack.push(0);
     minStack.push(-3);
     minStack.getMin();   --> 返回 -3.
     minStack.pop();
     minStack.top();      --> 返回 0.
     minStack.getMin();   --> 返回 -2.

     解题思路：
     使用2个数组，一个保存当前元素，一个保存最小元素
     **/

    
    /** initialize your data structure here. */
    var stack = [Int]()
    var minStack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let minValue = minStack.last {
            if minValue < x {
                minStack.append(minValue)
            } else {
                minStack.append(x)
            }
        } else {
            minStack.append(x)
        }
    }
    
    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func getMin() -> Int {
        return minStack.last ?? -1
    }
}
