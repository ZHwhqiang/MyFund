//
//  ArticleManager.swift
//  Coucou
//
//  Created by Ralf on 7/25/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class ArticleManager: Service
{
    func create(article article: [String: AnyObject]) -> ResultSet?
    {
        var params = article

        params["sessionId"] = self.sessionId


        let image = article["image"] as? UIImage
        if image != nil
        {
            let data = UIImageJPEGRepresentation(image!, 0.6)!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
            params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
            params["imageWidth"] = image!.size.width
            params["imageHeight"] = image!.size.height
        }
        let attachments = params["attachments"] as? NSMutableArray
        let rs          = request(endpoint: "article/createArticle", params: params as [String:AnyObject])

        if rs != nil && !rs!.hasErrors()
        {
            let data = rs!.toDictionary
            if attachments!.count > 0
            {
                for attachment in attachments!
                {
                    create(article: data(), attachment: attachment as! [String:AnyObject])
                }
            }
        }

        return rs
    }

    func create(article article: [String:AnyObject]!, attachment: [String:AnyObject]!)
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId

        let fileType = attachment["fileType"] as! String

        if fileType == "Image"
        {
            let image = attachment["image"] as! UIImage
            let data  = UIImageJPEGRepresentation(image, 0.6)!.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
            params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
            params["imageWidth"] = image.size.width
            params["imageHeight"] = image.size.height
        }
        else if fileType == "Video"
        {
            let video = attachment["video"] as! NSData
            let data  = video.base64EncodedDataWithOptions(.Encoding64CharacterLineLength)
            params["image"] = NSString(bytes: data.bytes, length: data.length, encoding: NSUTF8StringEncoding)
        }

        params["fileType"] = fileType
        params["articleId"] = article["id"]
        var description = attachment["description"] as? String
        description = stripString(description, length: 0)
        if description != nil && (description!).characters.count > 0
        {
            params["description"] = attachment["description"]
        }
        params["displayOrder"] = attachment["displayOrder"]

        request(endpoint: "attachment/uploadImage", params: params)
    }

    func query(userName userName: String!, max: Int!, offset: Int!) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId
        params["userName"] = userName
        params["max"] = String(max)
        params["offset"] = String(offset)

        return request(endpoint: "article/queryArticleByUserName", params: params)
    }

    func search(body body: String!, max: Int!, offset: Int!) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId
        params["body"] = body
        params["max"] = String(max)
        params["offset"] = String(offset)

        return request(endpoint: "article/queryArticleByBody", params: params)
    }

    func query(type type: String!, max: Int!, offset: Int!) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId
        params["max"] = String(max)
        params["offset"] = String(offset)
        params["type"] = type

        return request(endpoint: "article/queryByType", params: params)
    }
}
