//
//  MessageManager.swift
//  Coucou
//
//  Created by Ralf on 7/28/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class MessageManager: Service
{
    func getHistoryContactList() -> ResultSet
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.appDelegate.parameterManager.sessionId

        return request(endpoint: "message/getHistoryContactList", params: params)!
    }

    func receiveMessage(userName: String) -> ResultSet
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.appDelegate.parameterManager.sessionId
        params["userName"] = userName
        params["max"] = 100
        params["offset"] = 0

        return request(endpoint: "message/receiveMessage", params: params)!
    }

    func sendMessage(userName: String!, messageType: String!, message: String?, image: UIImage?, audio: NSData?) -> ResultSet
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.appDelegate.parameterManager.sessionId
        params["messageType"] = messageType

        if messageType == "Text"
        {
            params["message"] = message
        }
        else if messageType == "Image"
        {
            let data = UIImageJPEGRepresentation(image!, 0.6)!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
            params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        }
        else if messageType == "Audio"
        {
            let data = audio!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
            params["audio"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        }

        return request(endpoint: "message/sendMessage", params: params)!
    }
}
