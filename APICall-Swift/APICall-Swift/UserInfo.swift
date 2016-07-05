//
//  UserInfo.swift
//
//  Created by Rakesh Kumar on 03/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import Foundation

class UserInfo: NSObject {
    var userId: NSNumber!
    var mentorId: String!
    var userName: String!
    var password: String!
    var firstName: String!
    var lastName: String!
    var userRole: String!
    var gender: String!
    
    required init(userId: NSNumber!, userName: String!, password: String!, firstName:String, lastName:String, userRole: String!) {
        self.userId = userId
        self.userName = userName
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.userRole = userRole
        super.init()
    }
    
    //MARK: - NSCoding -
    required init(coder aDecoder: NSCoder) {
        userId = aDecoder.decodeObjectForKey("userId") as! NSNumber
        userName = aDecoder.decodeObjectForKey("userName") as! String
        password = aDecoder.decodeObjectForKey("password") as! String
        firstName = aDecoder.decodeObjectForKey("firstName") as! String
        lastName = aDecoder.decodeObjectForKey("lastName") as! String
        userRole = aDecoder.decodeObjectForKey("userRole") as! String
        gender = aDecoder.decodeObjectForKey("gender") as! String    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(userId, forKey: "userId")
        aCoder.encodeObject(userName, forKey: "userName")
        aCoder.encodeObject(password, forKey: "password")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(userRole, forKey: "userRole")
        aCoder.encodeObject(gender, forKey: "gender")
    }
    
    //Initializer
    /*JSON DATA
    {"sMessage":"Login Successfully.","sStatus":"0","details":{"id":1295,"fname":"test","lname":"","user_role":"student","gender":"Male"}}
    */
    
    func initWithUserInfo(uId: Int, username uName: String, password pwd: String) {
        
        self.userId = uId
        self.userName = uName
        self.password = pwd
    }
    
    func initWithUserInfo(uId: NSNumber, username uName: String, password pwd: String, firstName fname: String, lastName lname: String, userRole role: String, usergender gender: String) {
        
        self.userId = uId
        self.userName = uName
        self.password = pwd
        self.firstName = fname
        self.lastName = lname
        self.userRole = role
        self.gender = gender
    }
}
