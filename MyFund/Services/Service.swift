//
//  Service.swift
//  Coucou
//
//  Created by Ralf on 10/7/15.
//  Copyright © 2015 com.starlooking. All rights reserved.
//

import Foundation
import UIKit

class Service
{
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var sessionId: String!
    
    init()
    {
        sessionId = appDelegate.parameterManager.sessionId
    }
    
    func toUrl(endpoint endpoint: String) -> NSURL
    {
        return NSURL(string: appDelegate.parameterManager.server + "/" + endpoint)!
    }
    
    
    
    func request(endpoint endpoint: String!, params:[String:AnyObject]!) -> ResultSet?
    {
        let request = NSMutableURLRequest()
        request.URL = toUrl(endpoint: endpoint)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var rs: ResultSet?
        do
        {
            let options = NSJSONWritingOptions()
            let data = try NSJSONSerialization.dataWithJSONObject(params, options: options)
            request.HTTPBody = data
            var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
//            var responseData = try session.dataTaskWithRequest(request, completionHandler: response)
            var responseData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
            
            if responseData.length < 1
            {
                
            }
            else
            {
                let httpresponse = response as! NSHTTPURLResponse
                let statusCode = httpresponse.statusCode
                if statusCode == 200
                {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: .MutableContainers)
                    rs = ResultSet(data: json, statusCode: 200, errorCode: 0, errorMessage: "")
                }
                else if statusCode == 40
                {
                    let error = try NSJSONSerialization.JSONObjectWithData(responseData, options: .MutableContainers)
                    let errormessage = error["errorCode"] as! String!
                    rs = ResultSet(data: nil, statusCode: 400, errorCode: Int(errormessage)!, errorMessage: error["errorMessage"] as! String)
                }
            }
        }
        catch
        {
             print(error)
        }
        
        return rs
    }
}