//
//  Utility.swift
//  Boluoboluomi
//
//  Created by 李志军 on 15/8/3.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func GetViewController<T>(controllerName:String)->T {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let toViewController = mainStoryboard.instantiateViewControllerWithIdentifier(controllerName) as! T
        return toViewController
        
    }
}