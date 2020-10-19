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
        
//        node2.next = node3
//        node1.next = node2
        
        let node11 = ListNode(9)
        let node22 = ListNode(9)
        let node33 = ListNode(4)
        let node44 = ListNode(7)
        
//        node33.next = node44
//        node22.next = node33
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

