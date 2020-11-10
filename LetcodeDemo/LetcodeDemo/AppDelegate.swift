//
//  AppDelegate.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        func1()
        func2()
        func3()
        func4()
        func5()
        func6()
        func7()
        func8()
        func9()
        func10()
        func11()
        func12()
        func13()
        func14()
        func15()
        func16()
        func17()
        func18()
        func19()
        func20()
        func21()
        func22()
        func23()
        func24()
        func25()
        func26()
        func27()
        func28()
        func29()
        func30()
        func31()
        func32()
        func33()
        func34()
        func35()
        func36()
        func37()
        func38()
        func39()
        func40()
        func41()
        func42()
        func43()
        func44()
        func45()
        func46()
        func47()
        func48()
        func49()
        func50()
        func51()
        func52()
        func53()
        func54()
        func55()
        func56()
        func57()
        func58()
        func59()
        func60()
        func61()
        func62()
        
        func70()
        func78()
        
        func88()
        func89()
        
        func104()
        
        func121()
        func122()
        
        func124()
        
        func136()
        
        func141()
//        func142()   // 因为是有环，所以不能打印出来，打印结果的话，会陷入死循环
        
        func146()
        return true
    }

    // 1、两数之和
    func func1() {
        let arr = Solution1.twoSum([2, 7, 11, 15], 9)
        
        print("1. 两数之和arr = \(arr)")
    }
    
    // 2、2个数相加
    func func2() {
        let node1 = ListNode(1)
        let node2 = ListNode(9)
        let node3 = ListNode(3)
        
        node2.next = node3
        node1.next = node2
        
        let node11 = ListNode(9)
        let node22 = ListNode(9)
        let node33 = ListNode(4)
        let node44 = ListNode(7)
        
        node33.next = node44
        node22.next = node33
        node11.next = node22
        
        let node = AddTwo.addTwoNumbers(node1, node11)
        
        print("2. 2个数相加node = \(node?.description ?? "测试")")
    }
    // LRU
    func funcLru() {
        let cache = Cache(limitCount: 5)
        
        cache.setobject("a", forKey: "1")
        cache.setobject("b", forKey: "2")
        cache.setobject("c", forKey: "3")
        cache.setobject("d", forKey: "4")
        cache.setobject("e", forKey: "5")
        
        print("原链表:\(cache.description)") // 5:e 4:d 3:c 2:b 1:a
        
        let value = cache.objc(forKey: "3") ?? "zzzz"
        print("value = \(value)")
        print("取值之后链表:\(cache.description)") // 3:c 5:e 4:d 2:b 1:a
        
        cache.setobject("f", forKey: "6")
        print("新增元素之后链表:\(cache.description)") // 6:f 3:c 5:e 4:d 2:b
        
        cache.removeObjc(forKey: "4")
        print("删除元素之后链表:\(cache.description)") // 6:f 3:c 5:e 2:b
    }
    
    // 3. 无重复字符的最长子串
    func func3() {
        let length = Solution3.lengthOfLongestSubstring("abcabcbb")
        
        print("3. 无重复字符的最长子串 length: \(length)")
    }
    
    func func4() {
        let double = Solution4.findMedianSortedArrays([1, 2], [3, 4])
        print("4. 寻找两个正序数组的中位数 double:\(double)")
    }
    
    func func5() {
        //输入，并处理得到字符串s
        let string = Solution5.longestPalindrome("babad")
        
        print("5. 最长回文子串 string:\(string)")
    }
    
    func func6() {
//        let string = Solution6.convert("LEETCODEISHIRING", 3)
        
        let string = Solution6.convert("AB", 1)
        
        print("6. Z 字形变换 string:\(string)")
    }
    
    func func7() {
        let int = Solution7.reverse(123)
        
        print("7. 整数反转 int:\(int)")
    }
    
    func func8() {
        let int = Solution8.myAtoi("321")
        
        print("8. 字符串转换整数 (atoi) int:\(int)")
    }
    
    func func9() {
        let bool = Solution9.isPalindrome(3443)
        
        print("9. 回文数 bool:\(bool)")
    }
    
    func func10() {
        let bool = Solution10.isMatch("mississippi", "mis*is*p*.")
//        let bool = Solution10.isMatch("aa", "a*")
//        let bool = Solution10.isMatch("ab", ".*c")
//        let bool = Solution10.isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*a*a*b")
        
        
        print("10. 正则表达式匹配 bool:\(bool)")
    }
    
    func func11() {
        let int = Solution11.maxArea([1,8,6,2,5,4,8,3,7])
        print("11. 盛最多水的容器 int:\(int)")
    }
    
    func func12() {
        let string = Solution12.intToRoman(1994)
        print("12. 整数转罗马数字 string:\(string)")
    }
    
    func func13() {
        let int = Solution13.romanToInt("MCMXCIV")
        print("13. 罗马数字转整数 int:\(int)")
    }
    
    func func14() {
//        let string = Solution14.longestCommonPrefix(["flower","flow","flight"])
        let string = Solution14.longestCommonPrefix(["flower","flow","flight"])
        print("14. 最长公共前缀 string:\(string)")
    }
    
    func func15() {
        let array = Solution15.threeSum([-1, 0, 1, 2, -1, -4])
        print("15. 三数之和 array:\(array)")
    }
    
    func func16() {
        let int = Solution16.threeSumClosest([-1,2,1,-4], 1)
        print("16. 最接近的三数之和 int:\(int)")
    }
    
    func func17() {
        let string = Solution17().letterCombinations("23")
        print("17. 电话号码的字母组合 string:\(string)")
    }
    
    func func18() {
        let array = Solution18().fourSum([1, 0, -1, 0, -2, 2], 0)
        print("18. 四数之和 array:\(array)")
    }
    
    func func19() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let node = Solution19().removeNthFromEnd(node1, 2)
        print("19. 删除链表的倒数第N个节点 node:\(node?.description ?? "无链表")")
    }
    
    func func20() {
        let bool = Solution20().isValid("()[]{}")
        print("20. 有效的括号 bool:\(bool)")
    }
    
    func func21() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(4)
        
        let node11 = ListNode(1)
        let node22 = ListNode(3)
        let node33 = ListNode(4)
        
        node1.next = node2
        node2.next = node3
        
        node11.next = node22
        node22.next = node33
        
        let node = Solution21().mergeTwoLists(node1, node11)
        print("21. 合并两个有序链表 node:\(node?.description ?? "无链表")")
    }
    
    func func22() {
        let result = Solution22().generateParenthesis(3)
        print("22. 括号生成 result:\(result)")
    }
    
    func func23() {
        let node1 = ListNode(1)
        let node2 = ListNode(4)
        let node3 = ListNode(5)
        
        let node11 = ListNode(1)
        let node22 = ListNode(3)
        let node33 = ListNode(4)
        
        let node111 = ListNode(2)
        let node222 = ListNode(6)
        
        node1.next = node2
        node2.next = node3
        
        node11.next = node22
        node22.next = node33
        
        node111.next = node222
        
        let node = Solution23().mergeKLists([node1, node11, node111])
        print("23. 合并K个升序链表 node:\(node?.description ?? "无链表")")
    }
    
    func func24() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        let node = Solution24().swapPairs(node1)
        print("24. 两两交换链表中的节点 node:\(node?.description ?? "无链表")")
    }
    
    func func25() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        let node = Solution25().reverseKGroup(node1, 3)
        print("25. K 个一组翻转链表 node:\(node?.description ?? "无链表")")
    }
    
    func func26() {
//        var nums = [1,1,2]
        var nums = [0,0,2,2,3,3,4]
        let count = Solution26().removeDuplicates(&nums)
        print("26. 删除排序数组中的重复项 count:\(count)")
    }
    
    func func27() {
        var nums = [3,2,2,3]
        let count = Solution27().removeElement(&nums, 3)
        print("27. 移除元素 count:\(count)")
    }
    
    func func28() {
        let int = Solution28().strStr("hello", "ll")
        print("28. 实现 strStr() int:\(int)")
    }
    
    func func29() {
        let int = Solution29().divide(10, 3)
        print("29. 两数相除 int:\(int)")
    }
    
    func func30() {
        let array = Solution30().findSubstring("barfoothefoobarman", ["foo","bar"])
        print("30. 串联所有单词的子串 array:\(array)")
    }
    
    func func31() {
        var array = [1, 2, 3]
        Solution31().nextPermutation(&array)
        print("31. 下一个排列 array:\(array)")
    }
    
    func func32() {
        let int = Solution32().longestValidParentheses(")()())")
        print("32. 最长有效括号 int:\(int)")
    }
    
    func func33() {
        let int = Solution33().search([4,5,6,7,0,1,2], 0)
        print("33. 搜索旋转排序数组 int:\(int)")
    }
    
    func func34() {
        let array = Solution34().searchRange([5,7,7,8,8,10], 8)
        print("34. 在排序数组中查找元素的第一个和最后一个位置 array:\(array)")
    }
    
    func func35() {
        let index = Solution35().searchInsert([1,3,5,6], 5)
        print("35. 搜索插入位置 index:\(index)")
    }
    
    func func36() {
        let result = Solution36().isValidSudoku([
          ["5","3",".",".","7",".",".",".","."],
          ["6",".",".","1","9","5",".",".","."],
          [".","9","8",".",".",".",".","6","."],
          ["8",".",".",".","6",".",".",".","3"],
          ["4",".",".","8",".","3",".",".","1"],
          ["7",".",".",".","2",".",".",".","6"],
          [".","6",".",".",".",".","2","8","."],
          [".",".",".","4","1","9",".",".","5"],
          [".",".",".",".","8",".",".","7","9"]
        ])
        print("36. 有效的数独 result:\(result)")
    }
    
    func func37() {
        var board: [[Character]] = [
          ["5","3",".",".","7",".",".",".","."],
          ["6",".",".","1","9","5",".",".","."],
          [".","9","8",".",".",".",".","6","."],
          ["8",".",".",".","6",".",".",".","3"],
          ["4",".",".","8",".","3",".",".","1"],
          ["7",".",".",".","2",".",".",".","6"],
          [".","6",".",".",".",".","2","8","."],
          [".",".",".","4","1","9",".",".","5"],
          [".",".",".",".","8",".",".","7","9"]
        ]
        Solution37().solveSudoku(&board)
        print("37. 解数独 result:\(board)")
    }
    
    func func38() {
        let result = Solution38().countAndSay(6)
        print("38. 外观数列 result:\(result)")
    }
    
    func func39() {
        let result = Solution39().combinationSum([2,3,6,7], 7)
        print("39. 组合总和 result:\(result)")
    }
    
    func func40() {
        let result = Solution40().combinationSum2([10,1,2,7,6,1,5], 8)
        print("40. 组合总和 II result:\(result)")
    }
    
    func func41() {
        let result = Solution41().firstMissingPositive([1,2,0])
        print("41. 缺失的第一个正数 result:\(result)")
    }
    
    func func42() {
        let result = Solution42().trap([4,2,0,3,2,5])
        print("42. 接雨水 result:\(result)")
    }
    
    func func43() {
        let result = Solution43().multiply("123", "456")
        print("43. 字符串相乘 result:\(result)")
    }
    
    func func44() {
        let result = Solution44().isMatch("acdcb", "a*c?b")
        print("44. 通配符匹配 result:\(result)")
    }
    
    func func45() {
        let result = Solution45().jump([2,3,1,1,4])
        print("45. 跳跃游戏 II result:\(result)")
    }
    
    func func46() {
        let result = Solution46().permute([1,2,3])
        print("46. 全排列 result:\(result)")
    }
    
    func func47() {
        let result = Solution47().permuteUnique([1, 1, 2])
        print("47. 全排列 II result:\(result)")
    }
    
    func func48() {
        var matrix =
        [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        Solution48().rotate(&matrix)
        print("48. 旋转图像 result:\(matrix)")
    }
    
    func func49() {
        let result = Solution49().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        print("49. 字母异位词分组 result:\(result)")
    }
    
    func func50() {
        let x: Double = 3
        let n = 5
        let result = Solution50().myPow(x, n)
        print("50. Pow(\(x), \(n)) result:\(result)")
    }
    
    func func51() {
        let result = Solution51().solveNQueens(4)
        print("51. N 皇后 result:\(result)")
    }
    
    func func52() {
        let result = Solution52().totalNQueens(4)
        print("52. N皇后 II result:\(result)")
    }
    
    func func53() {
        let result = Solution53().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
        print("53. 最大子序和 result:\(result)")
    }
    
    func func54() {
        let matrix = [
         [ 1, 2, 3 ],
         [ 4, 5, 6 ],
         [ 7, 8, 9 ]
        ]
        let result = Solution54().spiralOrder(matrix)
        print("54. 螺旋矩阵 result:\(result)")
    }
    
    func func55() {
        let result = Solution55().canJump([2,3,1,1,4])
        print("55. 跳跃游戏 result:\(result)")
    }
    
    func func56() {
        let intervals = [[1,3],[2,6],[8,10],[15,18]]
        let result = Solution56().merge(intervals)
        print("56. 合并区间 result:\(result)")
    }
    
    func func57() {
        let result = Solution57().insert([[1,3],[6,9]], [2,5])
        print("57. 插入区间 result:\(result)")
    }
    
    func func58() {
        let result = Solution58().lengthOfLastWord("Hello World")
        print("58. 最后一个单词的长度 result:\(result)")
    }
    
    func func59() {
        let result = Solution59().generateMatrix(3)
        print("59. 螺旋矩阵 II result:\(result)")
    }
    
    func func60() {
        let result = Solution60().getPermutation(3, 3)
        print("60. 排列序列 result:\(result)")
    }
    
    func func61() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        let result = Solution61().rotateRight(node1, 2)
        print("61. 旋转链表 result:\(result?.description ?? "没有链表")")
    }
    
    func func62() {
        let result = Solution62().uniquePaths(7, 3)
        print("62. 不同路径 result:\(result)")
    }
    
    func func63() {
        
    }
    
    func func64() {
        
    }
    
    func func70() {
        let result = Solution70().climbStairs(3)
        print("70. 爬楼梯 result:\(result)")
    }
    
    func func78() {
        let result = Solution78().subsets([1, 2, 3])
        print("78. 子集 result:\(result)")
    }
    
    func func88() {
        var nums1 = [1,2,3,0,0,0]
        Solution88().merge(&nums1, 3, [2,5,6], 3)
        print("88. 合并两个有序数组 result:\(nums1)")
    }
    
    func func89() {
        let result = Solution89().grayCode(3)
        print("89. 格雷编码 result:\(result)")
    }
    
    func func104() {
//        [3,9,20,null,null,15,7]，
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        
        node3.left = node4
        node3.right = node5
        
        let result = Solution104().maxDepth(node1)
        print("104. 二叉树的最大深度 result:\(result)")
    }
    
    func func121() {
        let result = Solution121().maxProfit([7,1,5,3,6,4])
        print("121. 买卖股票的最佳时机 result:\(result)")
    }
    
    func func122() {
        let result = Solution122().maxProfit([7,1,5,3,6,4])
        print("122. 买卖股票的最佳时机 II result:\(result)")
    }
    
    func func124() {
        // [-10,9,20,null,null,15,7]
        let node1 = TreeNode(-10)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        
        node3.left = node4
        node3.right = node5
        let result = Solution124().maxPathSum(node1)
        print("124. 二叉树中的最大路径和 result:\(result)")
    }
    
    func func136() {
        let result = Solution136().singleNumber([4,1,2,1,2])
        print("136. 只出现一次的数字 result:\(result)")
    }
    
    func func141() {
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2
            
        let result = Solution141().hasCycle(node1)
        print("141. 环形链表 result:\(result)")
    }
    
    func func142() {
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2
        
        let result = Solution142().detectCycle(node1)
        print("142. 环形链表 II result:\(result?.description ?? "无环形链表")")
    }
    
    func func146() {
        let lRUCache = LRUCache(2)
//        lRUCache.put(1, 1); // 缓存是 {1=1}
//        lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
//        print("146. LRU缓存机制 lRUCache.get(1):\(lRUCache.get(1))") // 返回 1
//
//        lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
//        print("146. LRU缓存机制 lRUCache.get(2):\(lRUCache.get(2))") // 返回 -1 (未找到)
//        lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
//        print("146. LRU缓存机制 lRUCache.get(1):\(lRUCache.get(1))") // 返回 返回 -1 (未找到)
//        print("146. LRU缓存机制 lRUCache.get(3):\(lRUCache.get(3))") // 返回 3
//        print("146. LRU缓存机制 lRUCache.get(4):\(lRUCache.get(4))") // 返回 4
        
        
        lRUCache.put(2, 1); // 缓存是 {2=1}
        lRUCache.put(2, 2); // 缓存是 {2=2}
        print("146. LRU缓存机制 lRUCache.get(2):\(lRUCache.get(2))") // 返回 2
        
        lRUCache.put(1, 1); // 该操作会使得关键字 2 作废，缓存是 {1=1, 2=2}
//        print("146. LRU缓存机制 lRUCache.get(2):\(lRUCache.get(2))") // 返回 -1 (未找到)
        lRUCache.put(4, 1); // 该操作会使得关键字 1 作废，缓存是 {4=1, 1=1}
        print("146. LRU缓存机制 lRUCache.get(2):\(lRUCache.get(2))") // 返回 返回 -1 (未找到)
//        print("146. LRU缓存机制 lRUCache.get(3):\(lRUCache.get(3))") // 返回 3
//        print("146. LRU缓存机制 lRUCache.get(4):\(lRUCache.get(4))") // 返回 4
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


/// Definition for a list node.
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

/// Definition for a binary tree node.
public class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public override var description: String {
        var description = ""
        description.append("\(val)")
        var level = [TreeNode]()
        level.append(self)
        
        while level.count != 0 {
            var nextLevel = [TreeNode]()
            for tree in level {
                if let left = tree.left {
                    nextLevel.append(left)
                    description.append("->\(left.val)")
                } else {
                    description.append("->null")
                }
                if let right = tree.right {
                    nextLevel.append(right)
                    description.append("->\(right.val)")
                } else {
                    description.append("->null")
                }
            }
            
            level = nextLevel
        }
        
        return description
    }
}

