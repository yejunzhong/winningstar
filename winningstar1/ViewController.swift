//
//  ViewController.swift
//  winningstar1
//
//  Created by 叶俊中 on 2017/8/27.
//  Copyright © 2017年 叶俊中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topImageScrollView = TopImageScrollView()
    var isinit = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WinningStar"
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewdidappear")
        if !isinit{
        topImageScrollView.frame = CGRect(x: 0, y: 64, width: ScreenWidth, height: 150)
        self.view.addSubview(topImageScrollView)
        topImageScrollView.setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue: "I have got the fucking htmlText"), object: nil)
            isinit = true
        }
    }
    
    func test() {
        topImageScrollView.setUI()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

