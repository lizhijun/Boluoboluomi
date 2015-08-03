//
//  ServiceApi.swift
//  Boluoboluomi
//
//  Created by 李志军 on 15/8/3.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit

class ServiceApi: NSObject {
    
    static var host: String = "http://g.boluoboluomi.com"
    
    internal class func getTopicUrl(maxId:Int,count:Int) -> String {
        
        return "\(host)/api/topic/list2/\(maxId)/\(count)"
    }
    
    internal class func getTopicDetail(topicId:Int) -> String {
        
        return "\(host)/api/topic/\(topicId)"
    }
    
    internal class func getTopicShareDetail(topicId:Int) -> String {
        
        return "\(host)/topic/\(topicId).html"
    }
    
    internal class func getCodeShareDetail(codeId:Int) -> String {
        
        return "\(host)/code4swift/\(codeId).html"
    }
    
    internal class func getCodeUrl(maxId:Int,count:Int) -> String {
        
        return "\(host)/api/sharecode/list/\(maxId)/\(count)"
    }
    
    internal class func getCodeDetailUrl(codeId:Int) -> String {
        
        return "\(host)/api/sharecode/\(codeId)"
    }
    
    internal class func getBookUrl(type:Int,maxId:Int,count:Int) -> String{
        
        var url="\(host)/api/books/\(type)/\(maxId)/\(count)"
        return url
    }
    
    class func getLoginUrl()->String {
        var url = "\(host)/api/user/login"
        return url;
    }
    
    class func getRegistUrl() -> String {
        
        var url = "\(host)/api/user/reg"
        return url;
    }
    class func getTopicCommentUrl() -> String {
        
        var url = "\(host)/api/topic/comment"
        return url;
    }
    
    class func getCreateTopicUrl() -> String {
        
        var url = "\(host)/api/topic/create"
        return url;
    }
}