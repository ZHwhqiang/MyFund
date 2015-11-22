//
//  FavoritesManager.swift
//  Coucou
//
//  Created by Ralf on 7/28/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class FavoritesManager: Service
{
    func addFavorites(articleId: String) -> ResultSet
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId

        return request(endpoint: "favorites/addFavorites", params: params)!
    }

    func queryAllFavoritesBySessionId(max: Int, offset: Int) -> ResultSet?
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.sessionId
        params["max"] = max
        params["offset"] = offset

        return request(endpoint: "favorites/queryBySessionId", params: params)
    }
}
