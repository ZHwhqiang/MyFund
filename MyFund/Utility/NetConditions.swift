//
//  NetConditions.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/20.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit
import ReachabilitySwift

class NetConditions: NSObject {
    
    /// 判断网络状况
   static func able() -> Bool {
    
        var reachabitity: Reachability
        var yes: Bool!
        do {
            reachabitity = try Reachability.reachabilityForInternetConnection()
            
            reachabitity.whenReachable = {reachabitity in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    print("有网络")
                    yes = true
                })
            }
            reachabitity.whenUnreachable = {reachabitity in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    print("无网络")
                    yes = false
                })
            }
            
            if reachabitity.isReachable() {
                print("rachabitity.isReachable")
                return true
            }
            
            if reachabitity.isReachableViaWiFi() {
                print("reachability.is wifi")
                return true
            }
            
            if reachabitity.isReachableViaWWAN() {
                print("reachbility is ViaWWAN")
                return true
            }
            
            do {
                try reachabitity.startNotifier()
            }catch {
                print("Unable to start notifier")
            }
            
        }catch {
            print("Unable to create Reachability")
            return false
        }
        
        return yes
    }
    
}
