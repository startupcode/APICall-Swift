//
//  Config.swift
//
//  Created by Rakesh Kumar on 01/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import Foundation

// MARK: Global constant
let objBLib = BLibrary()
let objUserInfo = UserInfo(userId: 0, userName: "", password: "", firstName: "", lastName: "", userRole: "")
let defaults = NSUserDefaults.standardUserDefaults()


// MARK: - Global Properties
let WEB_URL = "http://abc.com"
// MARK: Web API links
let API_BASE_URL: String = "http://abc.com/"
let CALL_METHOD: String = "POST"
//Login
let URL_LOGIN: String = "/app-login"
let LOGIN_PARAM: String = "user_login=%@&user_pass=%@"
//Inbox
let URL_MESSAGE: String = "/api/message.php"
let MESSAGE_PARAM: String = "user_id=%@&action=%@"
let MESSAGE_ACTION_MESSAGES: String = "messages"
let MESSAGE_ACTION_UNREAD_COUNT: String = "count_unread"

let KEY_USER_DETAILS_NSDEFAULT = "CurrentLoginUserDetails"
// MARK: - Class Implementation
class Config: NSObject {
    
}

