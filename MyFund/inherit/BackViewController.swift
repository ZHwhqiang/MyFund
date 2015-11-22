//
//  BackViewController.swift
//  SwiftProjectTabBar
//
//  Created by wanghongqiang on 15/11/11.
//  Copyright © 2015年 王洪强. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {

    
    var leftBackBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        setLeftNavigationBarItem()
        self.hidesBottomBarWhenPushed = true        
        self.navigationController?.toolbar.backgroundColor = UIColor.redColor()
    }

    
    func setLeftNavigationBarItem() {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let width: CGFloat = 100
        let height: CGFloat = 50;
        leftBackBtn = UIButton(frame: CGRectMake(x, y, width, height))
        
        let backImage = UIImage(named: "") 
        let backImageView = UIImageView(frame: CGRectMake(0, 0, width / 3 , height))
        backImageView.image = backImage
        let label = UILabel(frame: CGRectMake(width / 3, 0, width * 2 / 3 , height))
        label.text = "返回"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(17)
        
        leftBackBtn?.addTarget(self, action: "back:", forControlEvents: UIControlEvents.TouchUpInside)
        leftBackBtn!.addSubview(backImageView)
        leftBackBtn!.addSubview(label)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBackBtn!)
        
        
    }
    
    func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
