//
//  ContactManager.swift
//  Coucou
//
//  Created by Ralf on 10/6/15.
//  Copyright © 2015 com.starlooking. All rights reserved.
//

import UIKit

class ContactManager: Service
{
    var contact = [String : AnyObject]()
    
    func findBySessionId() -> ResultSet?
    {
        var params = [String:AnyObject]()
        params["sessionId"] = self.appDelegate.parameterManager.sessionId
        return self.request(endpoint: "contact/queryBySessionId", params: params)
    }
    
    func loadContact() -> ResultSet?
    {
        let rs = findBySessionId()
        
        if rs != nil && rs!.statusCode == 200
        {
            self.contact = rs!.toDictionary()
        }
        
        return rs
    }
    
    func find(userName userName: String) -> ResultSet?
    {
        let params = ["userName":userName]
        
        return self.request(endpoint: "contact/queryByUserName", params: params)
    }
    
    func uploadAvatar(image image: UIImage) -> ResultSet?
    {
        let data  = UIImageJPEGRepresentation(image, 0.6)!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)

        var params = [String: AnyObject]()
        params["sessionId"] = self.sessionId
        params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        return self.request(endpoint: "contact/uploadAvatar", params: params)

    }
    
    func uploadBackground(image image: UIImage) -> ResultSet?
    {
        let data  = UIImageJPEGRepresentation(image, 0.6)!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
        
        var params = [String: AnyObject]()
        params["sessionId"] = self.sessionId
        params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        return self.request(endpoint: "contact/uploadBackground", params: params)
    }
    
    func logout()
    {
//        self.contact = nil
        self.contact.removeAll()
        appDelegate.parameterManager.sessionId = nil
        appDelegate.parameterManager.save()
    }
    
    func findFollowing(max max: Int, offset: Int) -> ResultSet?
    {
        let params = ["sessionId":self.sessionId, "max":"\(max)", "offset":"\(offset)"]
        return self.request(endpoint: "contact/getFollowingList", params: params)
    }
    
    func follow(userName userName: String) -> ResultSet?
    {
        let params = ["sessionId":self.sessionId, "userName":userName]
        return self.request(endpoint: "contact/follow", params: params)
    }
    
    func find(alias alias: String) -> ResultSet?
    {
        let params = ["alias":alias]
        return self.request(endpoint: "contact/queryByAlias", params: params)
    }
    
    func updateProfile(var profile profile:[String:AnyObject]!) -> ResultSet?
    {
        profile["sessionId"] = self.sessionId
        return self.request(endpoint: "contact/updateProfile", params: profile)
    }
    
    func findFollower(max max: Int, offset: Int) -> ResultSet?
    {
        let params = ["sessionId":self.sessionId, "max":"\(max)", "offset":"\(offset)"]
        return self.request(endpoint: "contact/getFollowerList", params: params)
    }
    
    func login(userName userName: String, password: String) -> ResultSet?
    {
        let params = ["userName":userName, "password":password]
        let rs = self.request(endpoint: "contact/login", params: params)
        if rs == nil || rs!.hasErrors() || rs!.isEmpty()  // rs.empty//rs == nil || rs!.hasErrors() || rs?.isEmpty()
        {
            return nil
        }
        else
        {
            self.contact = rs!.toDictionary()
            self.appDelegate.parameterManager.sessionId = self.contact["sessionId"] as? String
            self.appDelegate.parameterManager.save()
            
            return rs
        }
    }
    
    func register(userName userName: String, password: String) -> ResultSet?
    {
        let params = ["userName":userName, "password":password]
        return self.request(endpoint: "contact/register", params: params)
    }
    
    func login(wechat wechat: [String:AnyObject]) -> ResultSet?
    {
        let rs = self.request(endpoint: "contact/loginWithWeChat", params: wechat)
        
        if rs == nil || rs!.hasErrors() || rs!.isEmpty()
        {
            return nil
        }
        else
        {
            self.contact = rs!.toDictionary()
//            self.appDelegate.parameterManager.sessionId = self.contact?.objectForKey("sessionId") as! String
            self.appDelegate.parameterManager.sessionId = self.contact["sessionId"] as? String
            self.appDelegate.parameterManager.save()
            
            return rs
        }
    }
    
    func login(weibo weibo: [String:AnyObject]) -> ResultSet?
    {
        let rs = self.request(endpoint: "contact/loginWithWeibo", params: weibo)
        
        if rs == nil || rs!.hasErrors() || rs!.isEmpty()
        {
            return nil
        }
        else
        {
            self.contact = rs!.toDictionary()
            self.appDelegate.parameterManager.sessionId = self.contact["sessionId"] as? String
            self.appDelegate.parameterManager.save()
            
            return rs
        }
    }
    
    func login(qq qq: [String:AnyObject]) -> ResultSet?
    {
        let rs = self.request(endpoint: "contact/loginWithQQ", params: qq)
        
        if (rs == nil || rs!.hasErrors() || rs?.isEmpty() != nil)
        {
            return nil
        }
        else
        {
            self.contact = rs!.toDictionary()
            self.appDelegate.parameterManager.sessionId = self.contact["sessionId"] as? String
            self.appDelegate.parameterManager.save()
            
            return rs
        }
    }
}
