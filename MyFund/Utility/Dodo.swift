//
//  Dodo.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/20.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit
import Foundation
import Dodo


class Dodo: NSObject {
    
    
    /*
    style :
        DodoAnimations.Fade,
        DodoAnimations.NoAnimation,
        DodoAnimations.Rotate,
        DodoAnimations.SlideLeft,
        DodoAnimations.SlideRight,
        DodoAnimations.SlideVertically
    */
    
  static  func success(view: UIView, message: String) {
            view.dodo.style.bar.hideAfterDelaySeconds = 5.0                                 // 设置 5.0 秒后消失
            view.dodo.style.label.color = UIColor.whiteColor()                              // 设置字体颜色
            view.dodo.style.bar.backgroundColor = UIColor.greenColor()                      // 设置背景颜色
            view.dodo.style.bar.animationShow = DodoAnimations.Rotate.show                  // 设置 style
            view.dodo.style.leftButton.icon = .Close                                        // 设置leftbtn 开启
            view.dodo.style.leftButton.hideOnTap = true                                     // 设置 leftbtn 点击隐藏
            view.dodo.style.bar.marginToSuperview = CGSizeMake(SCREEN_WIDTH()/4, SCREEN_HEIGHT()/3) // 设置距离 左右 上下距离
            view.dodo.show(message)
        }
    
  static  func info(view: UIView, message: String) {
    
            view.dodo.style.bar.hideAfterDelaySeconds = 10.0                                // 设置 5.0 秒后消失
            view.dodo.style.label.color = UIColor.whiteColor()                              // 设置字体颜色
            view.dodo.style.bar.backgroundColor = UIColor.blueColor()                       // 设置背景颜色
            view.dodo.style.bar.animationShow = DodoAnimations.SlideLeft.show               // 设置 style
            view.dodo.style.leftButton.icon = .Close                                        // 设置leftbtn 开启
            view.dodo.style.leftButton.hideOnTap = true                                     // 设置 leftbtn 点击隐藏
            view.dodo.style.bar.marginToSuperview = CGSizeMake(SCREEN_WIDTH()/4, SCREEN_HEIGHT()/3) // 设置距离 左右 上下距离
            view.dodo.show(message)
        }
    
  static  func warning(view: UIView, message: String) {
    
            view.dodo.style.bar.hideAfterDelaySeconds = 8.0                                 // 设置 5.0 秒后消失
            view.dodo.style.label.color = UIColor.whiteColor()                              // 设置字体颜色
            view.dodo.style.bar.backgroundColor = UIColor.yellowColor()                     // 设置背景颜色
            view.dodo.style.bar.animationShow = DodoAnimations.SlideVertically.show         // 设置 style
            view.dodo.style.leftButton.icon = .Close                                        // 设置leftbtn 开启
            view.dodo.style.leftButton.hideOnTap = true                                     // 设置 leftbtn 点击隐藏
            view.dodo.style.bar.marginToSuperview = CGSizeMake(SCREEN_WIDTH()/4, SCREEN_HEIGHT()/3) // 设置距离 左右 上下距离
            view.dodo.show(message)
        }
    
    static  func error(view: UIView, message: String) {
        
            view.dodo.style.bar.hideAfterDelaySeconds = 8.0                                 // 设置 5.0 秒后消失
            view.dodo.style.label.color = UIColor.whiteColor()                              // 设置字体颜色
            view.dodo.style.bar.backgroundColor = UIColor.redColor()                        // 设置背景颜色
            view.dodo.style.bar.animationShow = DodoAnimations.SlideVertically.show         // 设置 style
            view.dodo.style.leftButton.icon = .Close                                        // 设置leftbtn 开启
            view.dodo.style.leftButton.hideOnTap = true                                     // 设置 leftbtn 点击隐藏
            view.dodo.style.bar.marginToSuperview = CGSizeMake(SCREEN_WIDTH()/4, SCREEN_HEIGHT()*2/3) // 设置距离 左右 上下距离
            view.dodo.show(message)
        }
    
}
