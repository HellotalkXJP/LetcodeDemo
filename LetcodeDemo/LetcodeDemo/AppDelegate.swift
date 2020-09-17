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
//        let bool = Solution10.isMatch("mississippi", "mis*is*p*.")
//        let bool = Solution10.isMatch("aa", "a*")
//        let bool = Solution10.isMatch("ab", ".*c")
        let bool = Solution10.isMatch("aaaaaaaaaaaaab", "a*a*a*a*a*a*a*a*a*a*a*a*b")
        
        
        print("10. 正则表达式匹配 bool:\(bool)")
    }
    
    func func11() {
        let int = Solution11.maxArea([1,8,6,2,5,4,8,3,7])
        print("11. 盛最多水的容器 int:\(int)")
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

