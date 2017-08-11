//
//  ViewController.swift
//  CMExchangeComputer
//
//  Created by CM on 2017/8/11.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        
        let computer = CMExchangeComputer.getInstance(showType: "sell",
                                                      titlebuttonConfim: "卖出",
                                                      imageForButton_del: #imageLiteral(resourceName: "back_sell"),
                                                      thumbImageSlider: #imageLiteral(resourceName: "thumb_sell"),
                                                      imageIcon: #imageLiteral(resourceName: "user_circle"),
                                                      tintColor: UIColor.red,
                                                      dismissViewDoWhat: {
                                                        
        }) {
            
        }
        
        computer.frame = CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: 360)
        self.view.addSubview(computer)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


