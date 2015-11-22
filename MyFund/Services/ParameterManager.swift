//
//  ParameterManager.swift
//  Coucou
//
//  Created by Ralf on 10/7/15.
//  Copyright © 2015 com.starlooking. All rights reserved.
//

import Foundation

class ParameterManager
{
    let server = "http://www.picture-book-garden.com/cuckoo-server"
    var sessionId: String?

    private var params = [String:AnyObject]()
    
    init()
    {
        load()
    }
    
    func load()
    {
        let filePath = NSHomeDirectory() + "/parameters.plist"
        
        if NSFileManager.defaultManager().fileExistsAtPath(filePath)
        {
//            self.params = Dictionary.init()?.(contentsOfFile:filePath)
            self.params = NSDictionary.init(contentsOfFile: filePath)! as! [String : AnyObject]
            self.sessionId = params["sessionId"] as? String
        }
        else
        {
            self.params = [:]
        }
    }
    
    func save()
    {
        let filePath = NSHomeDirectory() + "/parameters.plist"
        
        if self.sessionId != nil && self.sessionId!.characters.count > 0
        {
            self.params["sessionId"] = sessionId
        }
        else
        {
            self.params["sessionId"] = nil
        }
        
        
        var dic:NSDictionary
        dic = self.params
        dic.writeToFile(filePath, atomically: true)
        
    }
}
