//
//  MainTabBarViewController.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/18.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MainTabBarViewController: UITabBarController {

    var t = Twotimes.one
    override func viewDidLoad() {
        super.viewDidLoad()
        Loading.start()
        
        let btn = UIButton(type: .ContactAdd)
        btn.frame = CGRectMake(0, 0, 100, 64)
        btn.addTarget(self, action: "btnAction:", forControlEvents: .TouchUpInside)
        view.addSubview(btn)
        
        
        let text = "37142719900109043x"
        let boo = validateIdentityCard(text)
        print(boo)
        
        let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
        print("path=\(path)")
        
    }
    
    func btnAction(sender: AnyObject) {
        
        switch t {
        case .one:
            t = .two
            Loading.stop()
            Dodo.success(view, message: "success")
        case .two:
            t = .three
            Dodo.warning(view, message: "wanging")
        case .three:
            t = .four
            Dodo.error(view, message: "error")
        case .four:
            t = .one
            Dodo.info(view, message: "four")
        }
        
    }
    
    
    enum Twotimes {
        case one
        case two
        case three
        case four
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
