//
//  CommentManager.swift
//  Coucou
//
//  Created by Ralf on 7/28/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class CommentManager: Service
{
    func queryByArticleId(articleId: String, max: Int, offset: Int) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["articleId"] = articleId

        return request(endpoint: "comment/queryCommentsByArticleId", params: params)
    }

    func create(articleId: String, message: String) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId
        params["articleId"] = articleId
        params["message"] = message

        return request(endpoint: "comment/addComment", params: params)
    }
}
