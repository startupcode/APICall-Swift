//
//  vcLogin.swift
//
//  Created by Rakesh Kumar on 03/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import UIKit

class vcLogin: UIViewController {
    
    @IBOutlet var menuButton:UIBarButtonItem!
    @IBOutlet var btnLogin:UIButton!
    @IBOutlet var txtUserName:UITextField!
    @IBOutlet var txtPassword:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    @IBAction func loginAction(sender: UIButton) {
        let loginCtrl = loginController()
        objUserInfo.initWithUserInfo(0, username: txtUserName.text!, password: txtPassword.text!)
        loginCtrl.authenticateLoginInfo()
    }
    
    //MARK: - IBAction
    @IBAction func lostPasswordAction(sender: UIButton) {
        
    }
}
