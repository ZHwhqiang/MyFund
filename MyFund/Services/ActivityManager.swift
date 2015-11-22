//
//  ActivityManager.swift
//  Coucou
//
//  Created by Ralf on 7/28/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class ActivityManager: Service
{
    func queryByFollowing(max: Int!, offset: Int!, tag: String?) -> ResultSet
    {
        var params = [String: AnyObject]()
        params["max"] = max
        params["offset"] = offset
        if tag != nil
        {
            params["tag"] = tag
        }

        return request(endpoint: "activity/queryByFollow", params: params)!
    }

    func queryByFavorites(max: Int!, offset: Int!, tag: String?) -> ResultSet
    {
        var params = [String: AnyObject]()
        params["max"] = max
        params["offset"] = offset
        if tag != nil
        {
            params["tag"] = tag
        }

        return request(endpoint: "activity/queryByFavorites", params: params)!
    }
    
}
