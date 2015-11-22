//
//  ResultSet.swift
//  Coucou
//
//  Created by Ralf on 10/7/15.
//  Copyright © 2015 com.starlooking. All rights reserved.
//

import Foundation

class ResultSet
{
    var data: AnyObject?
    var statusCode: Int?
    var errorCode: Int?
    var errorMessage: String?
    
    
    init(data: AnyObject?, statusCode: Int, errorCode: Int, errorMessage: String)
    {
        self.data = data
        self.statusCode = statusCode
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
    
    
    func isEmpty() -> Bool
    {
        return self.data == nil
    }
    
    func hasErrors() -> Bool
    {
        return statusCode != 200
    }
    
    func toArray() -> [AnyObject]?
    {
        if !self.isEmpty() && !self.hasErrors()
        {
            return data as? [AnyObject]
        }
        else
        {
            return nil
        }
    }
    
    func toMutableArray() -> [AnyObject]
    {
        let buffer = NSMutableArray()
        for o in toArray()!
        {
            let dict = o as! NSDictionary
            buffer.addObject(NSMutableDictionary(dictionary: dict))
        }
        
        return buffer as [AnyObject]
    }
    
    func toDictionary() -> [String:AnyObject]
    {
        return data as! [String:AnyObject]
    }
    
    func toMutableDictionary() -> NSMutableDictionary
    {
        let dict = data! as! NSDictionary
        return NSMutableDictionary(dictionary: dict)
    }
}
