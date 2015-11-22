//
//  ReportManager.swift
//  Coucou
//
//  Created by Ralf on 7/28/15.
//  Copyright (c) 2015 com.starlooking. All rights reserved.
//

import UIKit

class ReportManager: Service
{
    func submitReport(type: String, source: String?, sourceId: String?, description: String) -> ResultSet
    {
        var params = [String: AnyObject]()

        params["sessionId"] = self.appDelegate.parameterManager.sessionId
        params["type"] = type

        if source != nil
        {
            params["source"] = source
        }

        if sourceId != nil
        {
            params["sourceId"] = sourceId
        }

        params["description"] = description

        return request(endpoint: "report/submitReport", params: params)!
    }
}
