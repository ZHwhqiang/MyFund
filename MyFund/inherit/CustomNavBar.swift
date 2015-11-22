//
//  CustomNavBar.swift
//  SwiftProjectTabBar
//
//  Created by wanghongqiang on 15/11/11.
//  Copyright © 2015年 王洪强. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationBar {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawRect(rect: CGRect) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH(), 64)
        self.backgroundColor = UIColor.redColor()
//        UIImage(named: "navBar.png")?.drawInRect(rect)
        self.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont.systemFontOfSize(17, weight: 2.0)]
    }

}
