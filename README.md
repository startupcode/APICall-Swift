# APICall-Swift
Class with methods to call API and parse JSON response with simple function calls

Check example in the given code.

Calling API
//Assign POST parameters
let postString = String(format: PARAM, param1, param2)

//Create request
let request = objBLib.getPostRequestUrl(URL, postParam:postString)

//Process API call, parse JSON node details and subnode fname
let returnedJsonData: NSDictionary = objBLib.processAPICalls(request)



Call methods as below as per your need

//Read Json if data is in Dictionary format and return Array
var arrJsonData: NSMutableArray = objBLib.readJsonDataInDictionary(returnedJsonData, readNode: "details")

//Read Json if data is in array format and return Array
var arrJsonData: NSMutableArray = objBLib.readJsonData(returnedJsonData, readNode: "details")

//Read Json and return string
var strJsonData: String = objBLib.readJsonDataInString(returnedJsonData, readNode: "details")

//Read Json and return Int
/var intJsonData: Int = objBLib.readJsonDataInt(returnedJsonData, readNode: "details")

