//
//  File.swift
//
//  Created by Rakesh Kumar on 03/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import Foundation

class loginController: NSObject {

    var userRole: String!
    
    // MARK: - User Methods
    //Authenticate Login
    func authenticateLoginInfo()
    {
        //Assign POST parameters
        let postString = String(format: LOGIN_PARAM, objUserInfo.userName, objUserInfo.password)
        //Create request
        let request = objBLib.getPostRequestUrl(URL_LOGIN, postParam:postString)
        //Process API call, parse JSON node details and subnode fname
        let returnedJsonData: NSDictionary = objBLib.processAPICalls(request)
        //Assign UserId to global user object
        readUserInfo(returnedJsonData)
    }
    
    //Get single task info
    func getInfo() -> NSMutableArray {
        //Assign POST parameters
        let postString = String(format: LOGIN_PARAM, objUserInfo.userName, objUserInfo.password)
        //Create request
        let request = objBLib.getPostRequestUrl(URL_LOGIN, postParam:postString)
        //Process API call, parse JSON node details and subnode fname
        let returnedJsonData: NSDictionary = objBLib.processAPICalls(request)
        
        //******************************************************************
        //CALL DIFFERENT METHOD TO READ JSON HERE AS PER JSON RESPONSE
        //******************************************************************
        
        //Read JSON Data into Array
        var arrJsonData: NSMutableArray = objBLib.readJsonDataInDictionary(returnedJsonData, readNode: "details")
        //var arrJsonData: NSMutableArray = objBLib.readJsonData(returnedJsonData, readNode: "details")
        //var strJsonData: String = objBLib.readJsonDataInString(returnedJsonData, readNode: "details")
        //var intJsonData: Int = objBLib.readJsonDataInt(returnedJsonData, readNode: "details")
        
        //******************************************************************
        
        return arrJsonData
    }

    
    //Read user data from the response json
    func readUserInfo(jsonData: NSDictionary)
    {
        let userId: NSNumber = (jsonData.valueForKey("details"))!.valueForKey("id") as! NSNumber
        let fName: String = (jsonData.valueForKey("details"))!.valueForKey("fname") as! String
        let lName: String = (jsonData.valueForKey("details"))!.valueForKey("lname") as! String
        let gender: String = (jsonData.valueForKey("details"))!.valueForKey("gender") as! String
        
        userRole = (jsonData.valueForKey("details"))!.valueForKey("user_role") as! String
        
        //Initialize data with user info
        objUserInfo.initWithUserInfo(userId, username: objUserInfo.userName, password: objUserInfo.password, firstName: fName, lastName: lName, userRole: userRole, usergender: gender)
        
        //Set value to nsdefault
        let archivedUserObject = NSKeyedArchiver.archivedDataWithRootObject(objUserInfo)
        objBLib.setUserDefault(archivedUserObject as AnyObject?, KeyToSave: KEY_USER_DETAILS_NSDEFAULT)
    }
}