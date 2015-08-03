//
//  LoginViewController.swift
//  Boluoboluomi
//
//  Created by 李志军 on 15/7/31.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func userLogin(sender: UIButton) {
        
        println(username.text)
    }
    
    
    @IBAction func regAction(sender: AnyObject) {
        
        
        var regController:RegController = Utility.GetViewController("regController")
        
        self.navigationController?.pushViewController(regController, animated: true)
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
