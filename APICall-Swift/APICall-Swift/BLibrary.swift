//
//  blibrary.swift
//
//  Created by Rakesh Kumar on 02/06/16.
//  Copyright © 2016 Rakesh Kumar. All rights reserved.
//

import UIKit

class BLibrary: NSObject {
    
    //MARK: - Save/Get NSUserDefaults
    func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String)
    {
        if (ObjectToSave != nil)
        {
            defaults.setObject(ObjectToSave, forKey: KeyToSave)
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func getUserDefault(KeyToReturnValue : String) -> AnyObject?
    {
        if let name = defaults.valueForKey(KeyToReturnValue)
        {
            return name
        }
        return nil
    }
    
    func removeUserDefault(KeyToReturnValue : String)
    {
        defaults.removeObjectForKey(KeyToReturnValue)
    }
    
    
    // MARK: - HTTP Request Handler
    //getPostRequestUrl - converts post url in request url
    func getPostRequestUrl(apiName: String, postParam postString: String) -> NSMutableURLRequest
    {
        let api_post_url = API_BASE_URL + apiName
        let posturl: NSURL? = NSURL(string:api_post_url)
        
        let request = NSMutableURLRequest(URL: posturl!)
        request.HTTPMethod = CALL_METHOD
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        return request
    }
    
    //Parse JSON
    func parseJSONData(data: NSData, readNode nodeToRead: String, readSubNode subNodeToRead: String) -> String
    {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let item = json[nodeToRead] as? [String: AnyObject] {
                return item[subNodeToRead] as! String
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        return ""
    }
    
    //Create API Call
    func processAPICalls(request: NSMutableURLRequest) -> NSDictionary {
        
        var response: NSURLResponse?
        var reponseError: NSError?
        var urlData: NSData?
        var result = 0
        var jsonData: NSDictionary?
        
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            
        }
        catch{
            reponseError = error as NSError?
            urlData = nil
        }
        
        if ( urlData != nil ) {
            let res = response as! NSHTTPURLResponse!;
            
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                print (responseData)
                
                jsonData = (try! NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers )) as! NSDictionary
                
            } else {
                result = 0
            }
        } else {
            result = 0
            if let error = reponseError {
                print(error.localizedDescription)
            }
        }
        print(result)
        
        return jsonData!
    }
    
    //Read Json if data is in array format and return Array
    func readJsonData(jsonData: NSDictionary, readNode nodeToRead: String) -> NSMutableArray
    {
        let arrJsonData: NSMutableArray = jsonData.valueForKey(nodeToRead) as! NSMutableArray
        return arrJsonData
    }
    
    //Read Json if data is in Dictionary format and return Array
    func readJsonDataInDictionary(jsonData: NSDictionary, readNode nodeToRead: String) -> NSMutableArray
    {
        let dicJsonData: NSDictionary = jsonData.valueForKey(nodeToRead) as! NSDictionary
        let arrJsonData: NSMutableArray = NSMutableArray.init(object: dicJsonData)
        return arrJsonData
    }
    
    //Read Json and return string
    func readJsonDataInString(jsonData: NSDictionary, readNode nodeToRead: String) -> String
    {
        var jsonString: String = "0"
        
        if let jsonStringValue = jsonData.valueForKey(nodeToRead) as? String
        {
            jsonString = jsonStringValue
        }
        
        return jsonString
    }
    
    //Read Json and return Int
    func readJsonDataInt(jsonData: NSDictionary, readNode nodeToRead: String) -> Int
    {
        var jsonString: Int = 0
        
        if let jsonStringValue = jsonData.valueForKey(nodeToRead) as? Int
        {
            jsonString = jsonStringValue
        }
        
        return jsonString
    }
}

