//
//  AppDelegate.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/18.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: MainTabBarViewController!
    var parameterManager: ParameterManager!
    var contactManager: ContactManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        rootController = MainTabBarViewController()
        window?.rootViewController = rootController;
        window?.backgroundColor = UIColor.whiteColor()
        Loading.setNVActivityIndicatorView(rootController)
        
        parameterManager = ParameterManager()
        contactManager = ContactManager()
        
        if isLogged()
        {
            let rs = contactManager.loadContact()
            if rs == nil || rs!.hasErrors()
            {
                parameterManager.sessionId = ""
                parameterManager.save()
                contactManager.contact.removeAll()  // contactManager.contact = nil
            }
        }
        
        rootController.prefersStatusBarHidden()
        
        
        self.rootController.tabBar.translucent         = false
        self.rootController.tabBar.barTintColor        = ColorManager.ivory()
        self.rootController.tabBar.layer.shadowColor   = UIColor(white: 0, alpha: 0.3).CGColor
        self.rootController.tabBar.layer.shadowOpacity = 1
        self.rootController.tabBar.layer.shadowRadius  = 2
        self.rootController.tabBar.layer.shadowOffset  = CGSizeMake(-1, -1)

        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func isLogged() -> Bool
    {
        return parameterManager.sessionId != nil && parameterManager.sessionId!.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0
    }
    
    
    
    
}

