//
//  ViewController.swift
//  LetcodeDemo
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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


}

