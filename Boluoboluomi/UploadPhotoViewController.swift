//
//  UploadPhotoViewController.swift
//  Boluoboluomi
//
//  Created by 李志军 on 15/7/31.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit

class UploadPhotoViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "上传图片"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func publishClick(sender: AnyObject) {
        
        println(self.titleField.text)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
