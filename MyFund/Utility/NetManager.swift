//
//  NetManager.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/20.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class NetManager: NSObject {
    
    /*
    *  JSON 数据请求
    */
    ///JSON GET
    static func requestget(urlSTR: String, params:[String:AnyObject]?, callback: (obj: AnyObject?, response: NSHTTPURLResponse) -> Void,  andFailed: (response: NSHTTPURLResponse?, error: NSError?) -> Void){
        
        if !NetConditions.able() { return }
        
        Alamofire.request(.GET, urlSTR, parameters: params)
            .validate()
            .responseJSON { (response) -> Void in
                
                switch response.result {
                case .Success:
                    callback(obj: response.result.value, response: response.response!)
                case .Failure:
                    andFailed(response: response.response, error: response.result.error)
                }
                
                print(response.result.error)
        }
    }
    
    
    
    ///JSON post
    static func requestpost(urlSTR: String, params:[String:AnyObject]?, callback: (obj: AnyObject?, response: NSHTTPURLResponse) -> Void, andFailed: (response: NSHTTPURLResponse?, error: NSError?) -> Void){
        
        if !NetConditions.able() { return }

        Alamofire.request(.POST, "https://httpbin.org/get", parameters: params)
            .validate()
            .responseJSON { (response) -> Void in
                
                switch response.result {
                case .Success:
                    callback(obj: response.result.value, response: response.response!)
                case .Failure:
                    andFailed(response: response.response, error: response.result.error)
                }
                
                print(response.result.error)
        }
        
    }
    
    
    
    
    /*
    * xml 数据请求
    */
    
    /// xml  get
    static func requestXmlGet(urlSTR: String, params: [String:AnyObject]?, callback: (data: NSData?, response: NSHTTPURLResponse) -> Void, andFailed: (response: NSHTTPURLResponse?, error: NSError?) -> Void) {
        
        if !NetConditions.able() { return }

        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .validate()
            .responseData { response in
                switch response.result {
                case .Success:
                    callback(data: response.data, response: response.response!)
                case .Failure:
                    andFailed(response: response.response!, error: response.result.error)
                }
        }
        
    }
    
    
    /// xml  post
    static func requestXmlPost(urlSTR: String, params: [String:AnyObject]?, callback: (data: NSData?, response: NSHTTPURLResponse) -> Void, andFailed: (response: NSHTTPURLResponse?, error: NSError?) -> Void) {
        
        if !NetConditions.able() { return }

        Alamofire.request(.POST, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .validate()
            .responseData { response in
                switch response.result {
                case .Success:
                    callback(data: response.data, response: response.response!)
                case .Failure:
                    andFailed(response: response.response!, error: response.result.error)
                }
        }
        
    }
    
    
    /*
    *   manager
    */
    
   static func maner(urlSTR: String, params: [String:AnyObject]?, callBack: (obj: AnyObject?) -> Void ) {
    
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 10
        let manager = Alamofire.Manager.sharedInstance
        let headers = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    
        manager.request(.GET, urlSTR, parameters: params, encoding: .JSON, headers: headers)
                .responseString(completionHandler: { (respone) -> Void in
                })
                .responseJSON { (response) -> Void in
                    if response.result.isSuccess {
                        callBack(obj: response.result.value)
                    }
                    else {
                        print("+++\(response.response)")
                    }
        }
    }
    
    
    /*
    * xml 数据解析
    */
    
    class Parser: NSObject, NSXMLParserDelegate{
        
        var parser: NSXMLParser!        // 定义一个NSXMLParser 的对象指针
        var element: String!
        var arr: [AnyObject]!
        var callBack: ((obj: AnyObject) -> Void )!
        
        func sax(data: NSData, callback: (obj: AnyObject) -> Void){
            
                callBack = callback
                parser = NSXMLParser(data: data)
                //2. 设置当前类对象指针为parser 对象的代理
                parser.delegate = self
                
                //3. 将所有成员变量为集合的对象进行初始化
                arr = [AnyObject]()
                
                //4. 开始解析xml 数据
                parser.parse()
        }
        
        // 代理方法
        func parser(parser: NSXMLParser, foundCharacters string: String) {
            // swift 中的数组 字典 枚举 和 结构体 都是值类型, '=' 为copy
            element = string
        }
        //只要遇到节点结束， 就会调用该方法
        func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            
            if elementName == "TrainStation" {
                
                arr.append(element)
            }
        }
        
        func parserDidStartDocument(parser: NSXMLParser) {
            print("xml 解析开始")
        }
        func parserDidEndDocument(parser: NSXMLParser) {
            print("xml 解析结束")
            print("xml->arr=\(arr)")
            callBack(obj: arr)
        }
        
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
}
