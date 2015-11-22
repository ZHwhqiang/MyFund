//
//  Extension.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/20.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import Foundation
import UIKit
import Dodo


/// 判断无数字 无字母
func validateChineseName(text: String) -> Bool {
    
    let pattern = "\\d|[0-9]|[a-z]|[A-Z]"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithTransparentBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
}


/// 是否含有数字
func validateHasfigure(text: String) -> Bool {
    
    let pattern = "\\d"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithTransparentBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
}


/// 判断银行账号
func validateBankNumber(text: String) -> Bool {
    // 16 - 19 位
    let pattern = "^[1-9]\\d{15,18}$"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
}

/// 判断身份证号
func validateIdentityCard(text: String) -> Bool {
    
    let pattern = "^(\\d{14}|\\d{17})(\\d|[xX])$"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
    
}


/// 判断 密码
func validatePassword(text: String) -> Bool {
    
    let pattern = "^[a-zA-Z0-9]{6,20}+$"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
    
}

/// 手机号判断
func validateMobile(text: String) -> Bool {
    
    // 手机号以13， 15，18开头，八个 \d 数字字符
    let pattern = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
    
}


/// 邮箱判断
func validateEmail(text: String) -> Bool {
    
    let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
    
}


/// 大于0 的正数 判断

func validaeNumberGreater(text: String) -> Bool {
    
    let pattern = "^(([1-9]\\d{0,8})|([0-9]{1,8}[.][0-9]{1,2}))$"

    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive) as NSRegularExpression
        let results = regex.matchesInString(text, options: .WithoutAnchoringBounds, range: NSMakeRange(0, text.characters.count))
        if results.count > 0 { return true }
        return false
    }
    catch {
        print("判断失败")
        return false
    }
}





